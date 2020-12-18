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
