import Foundation

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

public protocol BaseArrowArrayElement: CustomStringConvertible {
}

protocol ArrowArrayElement: Equatable, BaseArrowArrayElement {
    static func toGArrowArray(array: [Self]) throws -> UnsafeMutablePointer<GArrowArray>?
    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Self]
}

extension Date: ArrowArrayElement {
    static func toGArrowArray(array: [Date]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let timestampDataType = garrow_timestamp_data_type_new(GARROW_TIME_UNIT_NANO)
        let arrayBuilder: UnsafeMutablePointer<GArrowTimestampArrayBuilder>? =
            garrow_timestamp_array_builder_new(timestampDataType)
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        var cValues = array.map { $0.nanosecondsSince1970 }
        #else
        let numValues: Int = array.count
        var cValues = array.map { Int($0.nanosecondsSince1970) }
        #endif
        result = garrow_timestamp_array_builder_append_values(arrayBuilder,
                                                              &cValues,
                                                              numValues,
                                                              [],
                                                              0,
                                                              &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Date] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Date] = []
        for i in 0..<n {
            #if canImport(Darwin)
            let value: Int64 = garrow_timestamp_array_get_value(GARROW_TIMESTAMP_ARRAY(gArray), i)
            #else
            let value: Int64 = Int64(garrow_timestamp_array_get_value(GARROW_TIMESTAMP_ARRAY(gArray), i))
            #endif
            values.append(Date(nanoseconds: value))
        }
        return values
    }
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

protocol ConvertibleFromGArrowArray {
    init?(gArray: UnsafeMutablePointer<GArrowArray>?)
}

// From https://github.com/pvieito/PythonKit/blob/671302aebaa8b9bef4daccbf7fc07c014d1fd357/PythonKit/NumpyConversion.swift
extension Array: ConvertibleFromGArrowArray
where Element: ArrowArrayElement {
    init?(gArray: UnsafeMutablePointer<GArrowArray>?) {
        let primitiveArray: UnsafeMutablePointer<GArrowPrimitiveArray>? = GARROW_PRIMITIVE_ARRAY(gArray)
        let buffer: UnsafeMutablePointer<GArrowBuffer>? = garrow_primitive_array_get_data_buffer(primitiveArray)
        let ptrVal: OpaquePointer? = garrow_buffer_get_data(buffer) // GBytes
        var gSize = g_bytes_get_size(ptrVal)
        guard let bufferPointer: UnsafeRawPointer = g_bytes_get_data(ptrVal, &gSize) else {
            return nil
        }
        let ptr: UnsafePointer<Element> = bufferPointer.assumingMemoryBound(to: Element.self)

        // This code avoids constructing and initialize from `UnsafeBufferPointer`
        // because that uses the `init<S : Sequence>(_ elements: S)` initializer,
        // which performs unnecessary copying.
        let dummyPointer = UnsafeMutablePointer<Element>.allocate(capacity: 1)
        let scalarCount = Int(garrow_array_get_length(gArray))
        self.init(repeating: dummyPointer.move(), count: scalarCount)
        dummyPointer.deallocate()
        withUnsafeMutableBufferPointer { buffPtr in
            buffPtr.baseAddress!.assign(from: ptr, count: scalarCount)
        }
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

extension Int: ArrowArrayElement {
    static func toGArrowArray(array: [Int]) throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowInt64ArrayBuilder>? = garrow_int64_array_builder_new()
        #if canImport(Darwin)
        let numValues: Int64 = Int64(array.count)
        #else
        let numValues: Int = array.count
        #endif
        #if canImport(Darwin)
        var array = array.map { Int64($0) }
        #else
        var array = array
        #endif
        result = garrow_int64_array_builder_append_values(arrayBuilder,
                                                          &array,
                                                          numValues,
                                                          [],
                                                          0,
                                                          &error)
        return try completeGArrayBuilding(result: result, error: error, arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }

    static func fromGArrowArray(_ gArray: UnsafeMutablePointer<GArrowArray>?) -> [Int] {
        #if canImport(Darwin)
        let n: Int64 = garrow_array_get_length(gArray)
        #else
        let n: Int = garrow_array_get_length(gArray)
        #endif
        var values: [Int] = []
        for i in 0..<n {
            #if canImport(Darwin)
            let value: Int = Int(garrow_int64_array_get_value(GARROW_INT64_ARRAY(gArray), i))
            #else
            let value: Int = garrow_int64_array_get_value(GARROW_INT64_ARRAY(gArray), i)
            #endif
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
        #if canImport(Darwin)
        var array = array.map { Int64($0) }
        #else
        var array = array.map { Int($0) }
        #endif
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
            #if canImport(Darwin)
            let value: Int64 = garrow_int64_array_get_value(GARROW_INT64_ARRAY(gArray), i)
            #else
            let value: Int64 = Int64(garrow_int64_array_get_value(GARROW_INT64_ARRAY(gArray), i))
            #endif
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
        print(intValues)
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

/**
Used to finish the creation of a GArrowArray
*/
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
