import Foundation

import CArrow

// TODO: How can I do these types such that I can call functions on any type that is supported?
// I think type erasure with an AnyArrowSupportedType struct could accomplish this.
// An example is wanting to be able to call print() or .description on any supported type in printTable()
//  without needing an if statement on the types
// See here: https://medium.com/@chris_dus/type-erasure-in-swift-84480c807534

func completeGArrayBuilding(result: gboolean,
                            error: UnsafeMutablePointer<GError>?,
                            arrayBuilder: UnsafeMutablePointer<GArrowArrayBuilder>) throws ->
                                                                                UnsafeMutablePointer<GArrowArray>? {
    var error = error
    if result == 0 {
        let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
        g_error_free(error)
        g_object_unref(arrayBuilder)
        throw ArrowError.invalidArrayCreation(errorString)
    }
    let gArray: UnsafeMutablePointer<GArrowArray>? = garrow_array_builder_finish(arrayBuilder,
                                                                                 &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(arrayBuilder)
        throw ArrowError.invalidArrayCreation(errorString)
    }
    return gArray
}

protocol ArrowArrayElement: Equatable, CustomStringConvertible {
    static func toGArrowArray(array: [Self]) throws -> UnsafeMutablePointer<GArrowArray>?
    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) throws -> [Self]
}

extension String: ArrowArrayElement {
    static func toGArrowArray(array: [String]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowStringArrayBuilder>? = garrow_string_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        var cValues = array.map { UnsafePointer<Int8>(strdup($0)) }
        result = garrow_string_array_builder_append_strings(arrayBuilder,
                                                            &cValues,
                                                            numValues,
                                                            [],
                                                            0,
                                                            &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) throws -> [String] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [String] = []
        for i in 0..<n {
            let value: String = String(cString: garrow_string_array_get_string(GARROW_STRING_ARRAY(gArray), i))
            values.append(value)
        }
        return values
    }
}

extension Double: ArrowArrayElement {
    static func toGArrowArray(array: [Double]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowDoubleArrayBuilder>? = garrow_double_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        var array = array
        result = garrow_double_array_builder_append_values(arrayBuilder,
                                                           &array,
                                                           numValues,
                                                           [],
                                                           0,
                                                           &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) throws -> [Double] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Double] = []
        for i in 0..<n {
            let value: Double = garrow_double_array_get_value(GARROW_DOUBLE_ARRAY(gArray), i)
            values.append(value)
        }
        return values
    }
}

func gArrowDataTypeToSwift<T>(dataType: UnsafeMutablePointer<GArrowDataType>) throws -> T {
    if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
        return Double.self as! T // TODO: Is there any way to do this without force type casts?
    } else {
        throw ArrowError.unsupportedDataType("Unsupported data type \(dataType)")
    }
}
