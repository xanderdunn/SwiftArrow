import Foundation

import PenguinTables
#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

extension PTypedColumn {
    public var values: [T?] {
        var values = [T?]()
        for i in 0..<self.count {
            values.append(self[i])
        }
        return values
    }
}

// TODO: Improve performance by checking if there are any nulls. If not, call append_values rather than iterating with
//   append_value

extension PTypedColumn where T == String {
    func toGArrowArray() throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowStringArrayBuilder>? = garrow_string_array_builder_new()
        for value in self.values {
            if let value = value {
                let cValue: UnsafePointer<Int8>? = UnsafePointer<Int8>(strdup(value))
                result = garrow_string_array_builder_append_string(arrayBuilder, cValue, &error)
                try checkForError(result: result, error: error)
            } else {
                let cValue: UnsafePointer<Int8>? = UnsafePointer<Int8>(strdup(""))
                result = garrow_string_array_builder_append_string(arrayBuilder, cValue, &error)
                try checkForError(result: result, error: error)
            }
        }
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }
}

extension PTypedColumn where T == Bool {
    func toGArrowArray() throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowBooleanArrayBuilder>? = garrow_boolean_array_builder_new()

        for value in self.values {
            if let value = value, value == true {
                result = garrow_boolean_array_builder_append_value(arrayBuilder, Int32(1), &error)
                try checkForError(result: result, error: error)
            } else if let value = value, value == false {
                result = garrow_boolean_array_builder_append_value(arrayBuilder, Int32(0), &error)
                try checkForError(result: result, error: error)
            } else {
                result = garrow_boolean_array_builder_append_null(arrayBuilder, &error)
                try checkForError(result: result, error: error)
            }
        }
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }
}

extension PTypedColumn where T == Int {
    func toGArrowArray() throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowInt64ArrayBuilder>? = garrow_int64_array_builder_new()
        for value in self.values {
            if let value = value {
                #if canImport(Darwin)
                let valueTyped = Int64(value)
                #else
                let valueTyped = value
                #endif
                result = garrow_int64_array_builder_append_value(arrayBuilder, valueTyped, &error)
                assert(result != 0)
            } else {
                result = garrow_int64_array_builder_append_null(arrayBuilder, &error)
                assert(result != 0)
            }
        }
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }
}

extension PTypedColumn where T == Double {
    func toGArrowArray() throws -> UnsafeMutablePointer<GArrowArray>? {
        var error: UnsafeMutablePointer<GError>?
        var result: gboolean
        let arrayBuilder: UnsafeMutablePointer<GArrowDoubleArrayBuilder>? = garrow_double_array_builder_new()
        for value in self.values {
            if let value = value {
                result = garrow_double_array_builder_append_value(arrayBuilder, value, &error)
                try checkForError(result: result, error: error)
            } else {
                result = garrow_double_array_builder_append_null(arrayBuilder, &error)
                try checkForError(result: result, error: error)
            }
        }
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
    }
}

public extension PTable {
    // TODO: How to clean up this typing
    func toFeather(filePath: String) throws {
        var gArrays: [UnsafeMutablePointer<GArrowArray>?] = []
        // TODO: How to get the type of each column
        for columnName in self.columnNames {
            let column = self[columnName]!
            do {
                let typedColumn: PTypedColumn<Int> = try column.asDType()
                gArrays.append(try typedColumn.toGArrowArray())
            } catch {
                do {
                    let typedColumn: PTypedColumn<Double> = try column.asDType()
                    gArrays.append(try typedColumn.toGArrowArray())
                } catch {
                    do {
                        let typedColumn: PTypedColumn<String> = try column.asDType()
                        gArrays.append(try typedColumn.toGArrowArray())
                    } catch {
                        do {
                            let typedColumn: PTypedColumn<Bool> = try column.asDType()
                            gArrays.append(try typedColumn.toGArrowArray())
                        } catch {
                        }
                    }
                }
            }
        }
        let gTable = try gArraysToGTable(arrays: gArrays, columns: self.columnNames)
        if let gTable = gTable {
            try saveGTableToFeather(gTable, outputPath: filePath)
        } else {
            throw ArrowError.invalidTableCreation("Failed to create table")
        }
    }
}

protocol ArrowArrayElement: Equatable {
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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
        /*let dummyPointer = UnsafeMutablePointer<Element>.allocate(capacity: 1)*/
        let scalarCount = Int(garrow_array_get_length(gArray))
        // TODO: This is allocating memory equal to the size of the dataset
        self.init(unsafeUninitializedCapacity: scalarCount) { buffPtr, initializedCount in
            buffPtr.baseAddress!.assign(from: ptr, count: scalarCount)
            initializedCount = scalarCount
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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
        /*var array = array.map { Int64($0) }*/
        print("\(#function):\(#line)", getMemoryUsageString()!)
        var array = array
        print("\(#function):\(#line)", getMemoryUsageString()!)
        #else
        var array = array.map { Int($0) }
        #endif
        print("\(#function):\(#line)", getMemoryUsageString()!)
        // TODO: The below creates a copy of the bytes. Is there any way to do this without making a copy of the bytes?
        result = garrow_int64_array_builder_append_values(arrayBuilder,
                                                          &array,
                                                          numValues,
                                                          [],
                                                          0,
                                                          &error)
        try checkForError(result: result, error: error)
        print("\(#function):\(#line)", getMemoryUsageString()!)
        let returnValue = try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
        print("\(#function):\(#line)", getMemoryUsageString()!)
        return returnValue
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
        try checkForError(result: result, error: error)
        return try completeGArrayBuilding(arrayBuilder: GARROW_ARRAY_BUILDER(arrayBuilder))
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

func checkForError(result: gboolean, error: UnsafeMutablePointer<GError>?) throws {
    if result == 0 {
        let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
        throw ArrowError.invalidArrayCreation(errorString)
    }
}

/**
Used to finish the creation of a GArrowArray
*/
func completeGArrayBuilding(arrayBuilder: UnsafeMutablePointer<GArrowArrayBuilder>) throws ->
                                                                                UnsafeMutablePointer<GArrowArray>? {
    var error: UnsafeMutablePointer<GError>?
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
