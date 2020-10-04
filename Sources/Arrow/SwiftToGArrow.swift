import Foundation

import CArrow

func arrayToGArray<T>(values: [T]) throws -> UnsafeMutablePointer<GArrowArray>? {
    let valuesType = type(of: values).Element.self
    let arrayBuilder: UnsafeMutablePointer<GArrowArrayBuilder>?
    if valuesType == Double.self {
        arrayBuilder = GARROW_ARRAY_BUILDER(garrow_double_array_builder_new())
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
