import Foundation

import CArrow

func throwUnsupportedDataType(dataType: UnsafeMutablePointer<GArrowDataType>?, source: String) throws {
    var errorString = "Got GArrowArray with unsupported data type in call \(source)"
    if let typeString = garrow_data_type_to_string(dataType) {
        let swiftTypeString = String(cString: typeString)
        errorString += ": \(swiftTypeString)"
    }
    throw ArrowError.unsupportedDataType(errorString)
}

func gArrowTableColumnToSwift<T: ArrowArrayElement>(gTable: UnsafeMutablePointer<GArrowTable>,
                                                    column: Int32) throws -> [T] {
    if let chunkedArray = garrow_table_get_column_data(gTable, column),
       let gArray = gArrowChunkedArrayToGArrow(chunkedArray) {
           return T.self.fromGArrowArray(gArray)
    } else {
        throw ArrowError.failedRead("Couldn't get column from GArrowTable")
    }
}

func gArrowTableToSwift(gTable: UnsafeMutablePointer<GArrowTable>) throws -> [[CustomStringConvertible]] {
    var columnVectors: [[CustomStringConvertible]] = []
    let numColumns = garrow_table_get_n_columns(gTable)
    let timestampDataType = garrow_timestamp_data_type_new(GARROW_TIME_UNIT_NANO)
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
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_float_data_type_new())) == 1 {
                let swiftArray: [Float] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_int64_data_type_new())) == 1 {
                let swiftArray: [Int] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_boolean_data_type_new())) == 1 {
                let swiftArray: [Bool] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(timestampDataType)) == 1 {
                let swiftArray: [Date] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            } else {
                try throwUnsupportedDataType(dataType: dataType, source: "gArrowTableToSwift")
            }
        } else {
            throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")
        }
    }
    return columnVectors
}
