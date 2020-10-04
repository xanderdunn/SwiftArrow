import Foundation

import CArrow

protocol BaseArrowArrayElement {
}

protocol ArrowArrayElement: Equatable, CustomStringConvertible, BaseArrowArrayElement {
    static func toGArrowArray(array: [Self]) throws -> UnsafeMutablePointer<GArrowArray>?
    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Self]
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

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [String] {
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

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Double] {
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

extension Float: ArrowArrayElement {
    static func toGArrowArray(array: [Float]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowFloatArrayBuilder>? = garrow_float_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        var array = array
        result = garrow_float_array_builder_append_values(arrayBuilder,
                                                           &array,
                                                           numValues,
                                                           [],
                                                           0,
                                                           &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Float] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Float] = []
        for i in 0..<n {
            let value: Float = garrow_float_array_get_value(GARROW_FLOAT_ARRAY(gArray), i)
            values.append(value)
        }
        return values
    }
}

extension Int64: ArrowArrayElement {
    static func toGArrowArray(array: [Int64]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowInt64ArrayBuilder>? = garrow_int64_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        var array = array
        result = garrow_int64_array_builder_append_values(arrayBuilder,
                                                          &array,
                                                          numValues,
                                                          [],
                                                          0,
                                                          &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Int64] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Int64] = []
        for i in 0..<n {
            let value: Int64 = garrow_int64_array_get_value(GARROW_INT64_ARRAY(gArray), i)
            values.append(value)
        }
        return values
    }
}

extension Bool: ArrowArrayElement {
    static func toGArrowArray(array: [Bool]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowBooleanArrayBuilder>? = garrow_boolean_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        var intValues = array.map { $0 ? Int32(1) : Int32(0) }
        result = garrow_boolean_array_builder_append_values(arrayBuilder,
                                                          &intValues,
                                                          numValues,
                                                          [],
                                                          0,
                                                          &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Bool] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Bool] = []
        for i in 0..<n {
            let value: Bool = garrow_boolean_array_get_value(GARROW_BOOLEAN_ARRAY(gArray), i) != 0
            values.append(value)
        }
        return values
    }
}

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
