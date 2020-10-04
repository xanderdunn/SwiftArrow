import Foundation

import CArrow

func arrayToGArray<T: ArrowSupportedType>(values: [T]) throws -> UnsafeMutablePointer<GArrowArray>? {
    let valuesType = type(of: values).Element.self
    let arrayBuilder: UnsafeMutablePointer<GArrowArrayBuilder>?
    if valuesType == Double.self {
        arrayBuilder = GARROW_ARRAY_BUILDER(garrow_double_array_builder_new())
    } else if valuesType == String.self {
        arrayBuilder = GARROW_ARRAY_BUILDER(garrow_string_array_builder_new())
    } else {
        throw ArrowError.unsupportedDataType("Got array with type \(valuesType), which is not supported")
    }
    if let arrayBuilder = arrayBuilder {
        var error: UnsafeMutablePointer<GError>? = nil
        var result: gboolean
        #if canImport(Darwin)
        let numValues: Int64 = Int64(values.count)
        #else
        let numValues: Int = values.count
        #endif
        if valuesType == Double.self {
            var values = values as! [Double]
            result = garrow_double_array_builder_append_values(GARROW_DOUBLE_ARRAY_BUILDER(arrayBuilder),
                                                               &values,
                                                               numValues,
                                                               [],
                                                               0,
                                                               &error)
        } else if valuesType == String.self {
            let values = values as! [String]
            var cValues = values.map { UnsafePointer<Int8>(strdup($0)) }
            result = garrow_string_array_builder_append_strings(GARROW_STRING_ARRAY_BUILDER(arrayBuilder),
                                                               &cValues,
                                                               numValues,
                                                               [],
                                                               0,
                                                               &error)
            // This free is from here: https://stackoverflow.com/a/38275792/529743
            // TODO: I don't undersatnd when I need to free UnsafeMutablePointers and when I don't. Is there a
            //  closure that would obviate the need to manually call free?
            for ptr in cValues { free(UnsafeMutablePointer(mutating: ptr)) }
        } else {
            throw ArrowError.unsupportedDataType("Got array with type \(valuesType), which is not supported")
        }
        if result == 0 {
            let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
            g_error_free(error)
            g_object_unref(arrayBuilder)
            throw ArrowError.invalidArrayCreation(errorString)
        }
        let gArray: UnsafeMutablePointer<GArrowArray>? = garrow_array_builder_finish(GARROW_ARRAY_BUILDER(arrayBuilder),
                                                                                     &error)
        if result == 0 {
            let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
            g_error_free(error)
            g_object_unref(arrayBuilder)
            throw ArrowError.invalidArrayCreation(errorString)
        }
        g_object_unref(arrayBuilder)
        return gArray
    }
    throw ArrowError.invalidArrayCreation("Couldn't make new garrow_array_builder")
}
