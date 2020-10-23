import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

/*public func saveRowsToFeather(rows: [[BaseArrowArrayElement]], columnNames: [String], outputPath: String) throws {*/
    /*let columns = rows.transposed()*/
    /*try saveColumnsToFeather(columns: columns, columnNames: columnNames, outputPath: outputPath)*/
/*}*/

/*public func readColumnsFromFeather(filePath: String) throws -> ([[BaseArrowArrayElement]], [String]) {*/
    /*let gTable = try loadGTableFromFeather(filePath: filePath)*/
    /*if let gTable = gTable {*/
        /*let columns = try gArrowTableToSwift(gTable: gTable)*/
        /*return (columns, try gArrowTableGetSchema(gTable))*/
    /*} else {*/
        /*throw ArrowError.failedRead("Failed to read .feather file from \(filePath)")*/
    /*}*/
/*}*/
