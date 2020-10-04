import Foundation

import CArrow

func gArrowArrayToSwift<T>(_ array: UnsafeMutablePointer<GArrowArray>) throws -> [T] {
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
            values.append(value as! T)
        }
    } else {
        var errorString = "Got GArrowArray with unsupported data type"
        if let typeString = garrow_data_type_to_string(dataType) {
            errorString += ": \(typeString)"
        }
        throw ArrowError.unsupportedDataType(errorString)
    }
    return values
}
