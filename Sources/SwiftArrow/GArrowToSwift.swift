import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

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
    if let gArrowArray = garrow_chunked_array_get_chunk(garrow_table_get_column_data(gTable, column), 0) {
        return T.self.fromGArrowArray(gArrowArray)
    } else {
        throw ArrowError.failedRead("Couldn't get column from GArrowTable")
    }
}

// TODO: Parallelize this across columns
func gArrowTableToSwift(gTable: UnsafeMutablePointer<GArrowTable>) throws -> [[BaseArrowArrayElement]] {
    var columnVectors: [[BaseArrowArrayElement]] = []
    let numColumns = garrow_table_get_n_columns(gTable)
    let timestampDataType = garrow_timestamp_data_type_new(GARROW_TIME_UNIT_NANO)
    var error: UnsafeMutablePointer<GError>?
    let gTable = garrow_table_combine_chunks(gTable, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidTableCreation(errorString)
    }

    for i in 0..<numColumns {
        if let gTable = gTable, let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)) {
            let dataType = garrow_chunked_array_get_value_data_type(chunkedArray)
            if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                let swiftArray: [Double] = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
                columnVectors.append(swiftArray)
            /*if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {*/
                /*let swiftArray: [Double] = Array(gArray: )*/
                /*columnVectors.append(swiftArray)*/
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
