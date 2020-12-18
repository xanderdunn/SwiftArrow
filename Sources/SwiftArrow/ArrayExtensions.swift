import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

// From https://gist.github.com/dabrahams/ea5495b4cccc2970cd56e8cfc72ca761
// This should be considerably faster than the obj.io concurrent map implementation
// TODO: This large batching number may not work to parallelize very slow jobs like my column reading?
extension RandomAccessCollection {
    /// Returns `self.map(transform)`, computed in parallel.
    ///
    /// - Requires: `transform` is safe to call from multiple threads.
    func concurrentMap<B>(minBatchSize: Int = 1, _ transform: (Element) -> B) -> [B] {
        precondition(minBatchSize >= 1)
        let n = self.count
        let batchCount = (n + minBatchSize - 1) / minBatchSize
        if batchCount < 2 { return self.map(transform) }

        return Array(unsafeUninitializedCapacity: n) { uninitializedMemory, resultCount in
            resultCount = n
            let baseAddress = uninitializedMemory.baseAddress!

            /*print("Running DispatchQueue.concurrentPerform with batchCount \(batchCount)...")*/
            DispatchQueue.concurrentPerform(iterations: batchCount) { b in
                /*print("concurrentPerform iteration \(b)")*/
                let startOffset = b * n / batchCount
                let endOffset = (b + 1) * n / batchCount
                var sourceIndex = index(self.startIndex, offsetBy: startOffset)
                for p in baseAddress+startOffset..<baseAddress+endOffset {
                    p.initialize(to: transform(self[sourceIndex]))
                    formIndex(after: &sourceIndex)
                }
            }
        }
    }
}

public extension Array where Element == Float {
    func toFeather(filePath: String) throws {
        let gArray = try Float.toGArrowArray(array: self)
        let gTable = try gArraysToGTable(arrays: [gArray], columns: ["vector"])
        if let gTable = gTable {
            try saveGTableToFeather(gTable, outputPath: filePath)
        } else {
            throw ArrowError.invalidTableCreation("Failed to create table from \(self)")
        }
    }

    init(fromFeather filePath: String) throws {
        if let gTable = try loadGTableFromFeather(filePath: filePath),
        let chunkedArray = garrow_table_get_column_data(gTable, Int32(0)),
        let gArray = garrow_chunked_array_get_chunk(chunkedArray, 0) {
            guard let swiftArray: [Float] = Array(gArray: gArray) else {
                throw ArrowError.invalidArrayCreation("Couldn't convert Doubles GArrowArray to Swift Array")
            }
            self = swiftArray
        } else {
            throw ArrowError.failedRead("Failed to read gTable from \(filePath)")
        }
    }
}
