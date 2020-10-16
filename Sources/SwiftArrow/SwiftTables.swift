import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

func baseTypeToGArray(column: [BaseArrowArrayElement]) throws -> UnsafeMutablePointer<GArrowArray>? {
    let elementType = type(of: column).Element.self
    if let column = column as? [String] {
        return try String.toGArrowArray(array: column)
    } else if let column = column as? [Date] {
        return try Date.toGArrowArray(array: column)
    } else if let column = column as? [Float] {
        return try Float.toGArrowArray(array: column)
    } else if let column = column as? [Double] {
        return try Double.toGArrowArray(array: column)
    } else if let column = column as? [Int] {
        return try Int.toGArrowArray(array: column)
    } else if let column = column as? [Int64] {
        return try Int64.toGArrowArray(array: column)
    } else if let column = column as? [Bool] {
        return try Bool.toGArrowArray(array: column)
    } else {
        throw ArrowError.unsupportedDataType("\(elementType) not supported")
    }
}

public func saveColumnsToFeather(columns: [[BaseArrowArrayElement]], columnNames: [String], outputPath: String) throws {
    let gArrays = try columns.map { try baseTypeToGArray(column: $0) }
    let gTable = try gArraysToGTable(arrays: gArrays, columns: columnNames)
    if let gTable = gTable {
        try saveGTableToFeather(gTable, outputPath: outputPath)
    } else {
        throw ArrowError.invalidTableCreation("Failed to create table")
    }
}

public func saveRowsToFeather(rows: [[BaseArrowArrayElement]], columnNames: [String], outputPath: String) throws {
    let columns = rows.transposed()
    try saveColumnsToFeather(columns: columns, columnNames: columnNames, outputPath: outputPath)
}

public func readColumnsFromFeather(filePath: String) throws -> ([[BaseArrowArrayElement]], [String]) {
    let gTable = try loadGTableFromFeather(filePath: filePath)
    if let gTable = gTable {
        let columns = try gArrowTableToSwift(gTable: gTable)
        return (columns, try gArrowTableGetSchema(gTable))
    } else {
        throw ArrowError.failedRead("Failed to read .feather file from \(filePath)")
    }
}
