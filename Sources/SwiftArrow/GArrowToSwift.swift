import Foundation

import PenguinTables
#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

func gArrowTableColumnToSwift<T: ArrowArrayElement>(gArray: UnsafeMutablePointer<GArrowArray>) -> [T] {
    return T.self.fromGArrowArray(gArray)
}

// Reading from .feather
extension PTable {

    public init(fromFeather filePath: String) throws {
        let gTable = try loadGTableFromFeather(filePath: filePath)
        if let gTable = gTable {
            self = try PTable(gTable)
        } else {
            throw ArrowError.failedRead("Failed to read .feather file from \(filePath)")
        }
    }

    public init(_ gTable: UnsafeMutablePointer<GArrowTable>) throws {
        let numColumns = Int(garrow_table_get_n_columns(gTable))
        var error: UnsafeMutablePointer<GError>?
        let columnNames = try gArrowTableGetSchema(gTable)
        // TODO: This doubles memory usage. Instead of doing this, I should iterate through chunks
        let gTable = garrow_table_combine_chunks(gTable, &error)
        if let error = error {
            let errorString: String = String(cString: error.pointee.message)
            g_error_free(error)
            throw ArrowError.invalidTableCreation(errorString)
        }

        var columns: [String: PColumn] = [:]

        for i in 0..<numColumns {
            if let gTable = gTable, let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)),
               let gArray = garrow_chunked_array_get_chunk(chunkedArray, 0) {
                let dataType = garrow_chunked_array_get_value_data_type(chunkedArray)
                if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                    guard let swiftArray: [Double] = Array(gArray: gArray) else {
                        throw ArrowError.invalidArrayCreation("Couldn't convert Doubles GArrowArray to Swift Array")
                    }
                    columns[columnNames[i]] = PColumn(swiftArray)
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
                    let swiftArray: [String] = gArrowTableColumnToSwift(gArray: gArray)
                    columns[columnNames[i]] = PColumn(swiftArray)
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_int64_data_type_new())) == 1 {
                    guard let swiftArray: [Int] = Array(gArray: gArray) else {
                        throw ArrowError.invalidArrayCreation("Couldn't convert Ints GArrowArray to Swift Array")
                    }
                    let column: PColumn = PColumn(swiftArray)
                    columns[columnNames[i]] = column
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_boolean_data_type_new())) == 1 {
                    let swiftArray: [Bool] = gArrowTableColumnToSwift(gArray: gArray)
                    let column: PColumn = PColumn(swiftArray)
                    columns[columnNames[i]] = column
                } else {
                    var errorString = "Got GArrowArray with unsupported data type in call gArrowTableToSwift"
                    if let typeString = garrow_data_type_to_string(dataType) {
                        let swiftTypeString = String(cString: typeString)
                        errorString += ": \(swiftTypeString)"
                    }
                    throw ArrowError.unsupportedDataType(errorString)
                }
            } else {
                throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")
            }
        }
        self = try PTable(columns)
    }
}
