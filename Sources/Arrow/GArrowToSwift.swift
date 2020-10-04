import Foundation

import SwiftyTextTable
import CArrow

func throwUnsupportedDataType(dataType: UnsafeMutablePointer<GArrowDataType>?, source: String) throws {
    var errorString = "Got GArrowArray with unsupported data type in call \(source)"
    if let typeString = garrow_data_type_to_string(dataType) {
        let swiftTypeString = String(cString: typeString)
        errorString += ": \(swiftTypeString)"
    }
    throw ArrowError.unsupportedDataType(errorString)
}

func gArrowArrayToSwift<T: ArrowSupportedType>(_ array: UnsafeMutablePointer<GArrowArray>) throws -> [T] {
    #if canImport(Darwin)
    let n: Int64 = garrow_array_get_length(array)
    #else
    let n: Int = garrow_array_get_length(array)
    #endif
    var values: [T] = []
    let dataType = garrow_array_get_value_data_type(array)
    if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
        for i in 0..<n {
            let value: Double = garrow_double_array_get_value(GARROW_DOUBLE_ARRAY(array), i)
            values.append(value as! T) // TODO: Is there any way to do this without force casting?
        }
    } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
        for i in 0..<n {
            let value: String = String(cString: garrow_string_array_get_string(GARROW_STRING_ARRAY(array), i))
            values.append(value as! T) // TODO: Is there any way to do this without force casting?
        }
    } else {
        try throwUnsupportedDataType(dataType: dataType, source: "gArrowArrayToSwift")
    }
    return values
}

func gArrowTableColumnToSwift<T: ArrowSupportedType>(gTable: UnsafeMutablePointer<GArrowTable>,
                                                     column: Int32) throws -> [T] {
    if let chunkedArray = garrow_table_get_column_data(gTable, column),
       let gArray = gArrowChunkedArrayToGArrow(chunkedArray) {
           return try gArrowArrayToSwift(gArray)
    } else {
        throw ArrowError.failedRead("Couldn't get column from GArrowTable")
    }
}

// TODO: Only print the first n rows
public func printTable(gTable: UnsafeMutablePointer<GArrowTable>) throws {
    var columnVectors: [[CustomStringConvertible]] = []
    let numColumns = garrow_table_get_n_columns(gTable)
    for i in 0..<numColumns {
        if let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)),
           let gArray = gArrowChunkedArrayToGArrow(chunkedArray) {
            let dataType = garrow_array_get_value_data_type(gArray)
            if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                let swiftArray: [Double] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
                let swiftArray: [String] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else {
                try throwUnsupportedDataType(dataType: dataType, source: "printTable")
            }
        } else {
            throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")
        }
    }
    let textTableColumns: [TextTableColumn] = try gArrowTableGetSchema(gTable).map { TextTableColumn(header: $0) }
    for columnVector in columnVectors {
        assert(columnVector.count == columnVectors[0].count)
    }
    // TODO: This is very inefficient. Should simply be able to create a column with columnar values rather than
    //  adding by row
    var rowVectors: [[CustomStringConvertible]] = []
    for i in 0..<columnVectors[0].count {
        let rowVector = columnVectors.map { $0[i] }
        rowVectors.append(rowVector)
    }
    var textTable = TextTable(columns: textTableColumns)
    for rowVector in rowVectors {
        textTable.addRow(values: rowVector)
    }
    let tableString = textTable.render()
    print(tableString)
}
