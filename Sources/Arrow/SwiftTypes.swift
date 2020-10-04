import Foundation

import CArrow

protocol ArrowSupportedType: Equatable {
}

extension String: ArrowSupportedType {
}

extension Double: ArrowSupportedType {
}

func gArrowDataTypeToSwift<T>(dataType: UnsafeMutablePointer<GArrowDataType>) throws -> T {
    if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
        return Double.self as! T
    } else {
        throw ArrowError.unsupportedDataType("Unsupported data type \(dataType)")
    }
}
