import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

func gArrowTableColumnToSwift<T: ArrowArrayElement>(gArray: UnsafeMutablePointer<GArrowArray>) -> [T] {
    return T.self.fromGArrowArray(gArray)
}

// Reading from .feather
extension ArrowColumns {

    static func gArrowTableToSwift(gTable: UnsafeMutablePointer<GArrowTable>) throws -> ArrowColumns {
        /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
        let numColumns = Int(garrow_table_get_n_columns(gTable))
        let timestampDataType = garrow_timestamp_data_type_new(GARROW_TIME_UNIT_NANO)
        var error: UnsafeMutablePointer<GError>?
        let columnNames = try gArrowTableGetSchema(gTable)
        /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
        // TODO: This doubles memory usage. Instead of doing this, I should iterate through chunks
        let gTable = garrow_table_combine_chunks(gTable, &error)
        /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
        if let error = error {
            let errorString: String = String(cString: error.pointee.message)
            g_error_free(error)
            throw ArrowError.invalidTableCreation(errorString)
        }

        var columns = ArrowColumns()

        for i in 0..<numColumns {
        /*_ = Array(0..<numColumns).concurrentMap { i -> () in*/
            /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
            if let gTable = gTable, let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)),
               let gArray = garrow_chunked_array_get_chunk(chunkedArray, 0) {
                /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
                let dataType = garrow_chunked_array_get_value_data_type(chunkedArray)
                if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                    /*let swiftArray: [Double] = gArrowTableColumnToSwift(gArray: gArray)*/
                    /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
                    guard let swiftArray: [Double] = Array(gArray: gArray) else {
                        /*return*/
                        throw ArrowError.invalidArrayCreation("Couldn't convert Doubles GArrowArray to Swift Array")
                    }
                    /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
                    columns.addDoubleColumn(column: swiftArray, columnName: columnNames[i])
                    /*print("\(#file):\(#function):\(#line)", getMemoryUsageString()!)*/
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
                    let swiftArray: [String] = gArrowTableColumnToSwift(gArray: gArray)
                    columns.addStringColumn(column: swiftArray, columnName: columnNames[i])
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_float_data_type_new())) == 1 {
                    guard let swiftArray: [Float] = Array(gArray: gArray) else {
                        /*assertionFailure("Couldn't decode array as Float")*/
                        /*return*/
                        throw ArrowError.invalidArrayCreation("Couldn't get float as array")
                    }
                    columns.addFloatColumn(column: swiftArray, columnName: columnNames[i])
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_int64_data_type_new())) == 1 {
                    /*let swiftArray: [Int] = gArrowTableColumnToSwift(gArray: gArray)*/
                    guard let swiftArray: [Int] = Array(gArray: gArray) else {
                        /*return*/
                        throw ArrowError.invalidArrayCreation("Couldn't convert Ints GArrowArray to Swift Array")
                    }
                    columns.addIntColumn(column: swiftArray, columnName: columnNames[i])
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_boolean_data_type_new())) == 1 {
                    let swiftArray: [Bool] = gArrowTableColumnToSwift(gArray: gArray)
                    columns.addBoolColumn(column: swiftArray, columnName: columnNames[i])
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(timestampDataType)) == 1 {
                    let swiftArray: [Date] = gArrowTableColumnToSwift(gArray: gArray)
                    columns.addDateColumn(column: swiftArray, columnName: columnNames[i])
                } else {
                    var errorString = "Got GArrowArray with unsupported data type in call gArrowTableToSwift"
                    if let typeString = garrow_data_type_to_string(dataType) {
                        let swiftTypeString = String(cString: typeString)
                        errorString += ": \(swiftTypeString)"
                    }
                    /*return*/
                    throw ArrowError.unsupportedDataType(errorString)
                    /*assertionFailure(errorString)*/
                }
            } else {
                /*return*/
                /*assertionFailure()*/
                throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")
            }
        }
        return columns
    }
}
