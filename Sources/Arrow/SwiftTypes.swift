import Foundation

import CArrow

// TODO: How can I do these types such that I can call functions on any type that is supported?
// I think type erasure with an AnyArrowSupportedType struct could accomplish this.
// An example is wanting to be able to call print() or .description on any supported type in printTable()
//  without needing an if statement on the types
// See here: https://medium.com/@chris_dus/type-erasure-in-swift-84480c807534

protocol ArrowSupportedType: Equatable, CustomStringConvertible {
}

extension String: ArrowSupportedType {
}

extension Double: ArrowSupportedType {
}

func gArrowDataTypeToSwift<T>(dataType: UnsafeMutablePointer<GArrowDataType>) throws -> T {
    if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
        return Double.self as! T // TODO: Is there any way to do this without force type casts?
    } else {
        throw ArrowError.unsupportedDataType("Unsupported data type \(dataType)")
    }
}
