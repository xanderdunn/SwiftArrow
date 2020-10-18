import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

func gArrowTableColumnToSwift<T: ArrowArrayElement>(gArray: UnsafeMutablePointer<GArrowArray>) -> [T] {
    return T.self.fromGArrowArray(gArray)
}

func gArrowTableToSwift(gTable: UnsafeMutablePointer<GArrowTable>) throws -> [[BaseArrowArrayElement]] {
    let numColumns = garrow_table_get_n_columns(gTable)
    let timestampDataType = garrow_timestamp_data_type_new(GARROW_TIME_UNIT_NANO)
    var error: UnsafeMutablePointer<GError>?
    let gTable = garrow_table_combine_chunks(gTable, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidTableCreation(errorString)
    }

    let columnVectors = Array(0..<numColumns).concurrentMap { i -> [BaseArrowArrayElement] in
        print("Here1", getMemoryUsageString()!)
        if let gTable = gTable, let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)),
           let gArray = garrow_chunked_array_get_chunk(chunkedArray, 0) {
            print("Here1", getMemoryUsageString()!)
            let dataType = garrow_chunked_array_get_value_data_type(chunkedArray)
            if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                if let swiftArray: [Double] = Array(gArray: gArray) {
                    return swiftArray
                } else {
                    return []
                }
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
                let swiftArray: [String] = gArrowTableColumnToSwift(gArray: gArray)
                return swiftArray
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_float_data_type_new())) == 1 {
                if let swiftArray: [Float] = Array(gArray: gArray) {
                    return swiftArray
                } else {
                    return []
                }
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_int64_data_type_new())) == 1 {
                if let swiftArray: [Int] = Array(gArray: gArray) {
                    return swiftArray
                } else {
                    return []
                }
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_boolean_data_type_new())) == 1 {
                let swiftArray: [Bool] = gArrowTableColumnToSwift(gArray: gArray)
                return swiftArray
            } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(timestampDataType)) == 1 {
                let swiftArray: [Date] = gArrowTableColumnToSwift(gArray: gArray)
                return swiftArray
            } else {
                var errorString = "Got GArrowArray with unsupported data type in call gArrowTableToSwift"
                if let typeString = garrow_data_type_to_string(dataType) {
                    let swiftTypeString = String(cString: typeString)
                    errorString += ": \(swiftTypeString)"
                }
                return []
                /*throw ArrowError.unsupportedDataType(errorString)*/
            }
        } else {
            return []
            /*throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")*/
        }
    }
    return columnVectors
}
