import Foundation

import CArrow

enum ArrowError: Error {
    case invalidArrayCreation(String)
    case invalidTableCreation(String)
    case failedFeatherSave(String)
    case invalidFeatherReader(String)
    case invalidInputStream(String)
    case failedRead(String)
    case invalidFields(String)
    case invalidFeatherSave(String)
    case unsupportedDataType(String)
}

func gArrowChunkedArrayToGArrow(_ chunkedArray: UnsafeMutablePointer<GArrowChunkedArray>) ->
                                                                                [UnsafeMutablePointer<GArrowArray>?] {
    let numChunks = garrow_chunked_array_get_n_chunks(chunkedArray)
    // Support arbitrary chunks
    var gArrowArrays: [UnsafeMutablePointer<GArrowArray>?] = []
    for i in 0..<numChunks {
        let gArrowArray = garrow_chunked_array_get_chunk(chunkedArray, i)
        gArrowArrays.append(gArrowArray)
    }
    return gArrowArrays
}

/**
GList usage from here: https://github.com/apache/arrow/blob/master/c_glib/arrow-glib/schema.cpp#L241-L247
*/
func gArraysToGTable(arrays: [UnsafeMutablePointer<GArrowArray>?],
                     columns: [String]) throws -> UnsafeMutablePointer<GArrowTable>? {
    assert(arrays.count == columns.count, "Got \(arrays) column arrays but \(columns.count) column names, must be equal.")
    var fields: UnsafeMutablePointer<GList>?
    for (i, column) in columns.enumerated() {
        let cString = column.cString(using: .utf8)
        let dataType = garrow_array_get_value_data_type(arrays[i])
        let field = garrow_field_new(cString, dataType)
        fields = g_list_prepend(fields, field)
    }
    fields = g_list_reverse(fields)
    let schema = garrow_schema_new(fields)
    var error: UnsafeMutablePointer<GError>?
    var arrays = arrays
    let table = garrow_table_new_arrays(schema, &arrays, UInt(arrays.count), &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(schema)
        throw ArrowError.invalidTableCreation(errorString)
    }
    g_object_unref(schema)
    return table
}

func saveGTableToFeather(_ gTable: UnsafeMutablePointer<GArrowTable>, outputPath: String) throws {
    var error: UnsafeMutablePointer<GError>?
    // TODO: How do I turn on compression?
    let properties = garrow_feather_write_properties_new()
    let path = outputPath.cString(using: .utf8)
    let output = garrow_file_output_stream_new(path, 0, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(output)
        g_object_unref(properties)
        throw ArrowError.invalidFeatherSave(errorString)
    }
    let result: gboolean = garrow_table_write_as_feather(gTable, GARROW_OUTPUT_STREAM(output), properties, &error)
    if result == 0 {
        let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
        g_error_free(error)
        g_object_unref(output)
        g_object_unref(properties)
        throw ArrowError.invalidFeatherSave(errorString)
    }
    g_object_unref(output)
    g_object_unref(properties)
}

/**
Load table from file: GArrowFeatherFileReader
*/
func loadGTableFromFeather(filePath: String) throws -> UnsafeMutablePointer<GArrowTable>? {
    var error: UnsafeMutablePointer<GError>?
    let path = filePath.cString(using: .utf8)
    let inputStream = garrow_memory_mapped_input_stream_new(path, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidInputStream(errorString)
    }
    let reader = garrow_feather_file_reader_new(GARROW_SEEKABLE_INPUT_STREAM(inputStream), &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(inputStream)
        throw ArrowError.invalidFeatherReader(errorString)
    }
    let table = garrow_feather_file_reader_read(reader, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(reader)
        g_object_unref(inputStream)
        throw ArrowError.failedRead(errorString)
    }
    g_object_unref(reader)
    g_object_unref(inputStream)
    return table
}

func gArrowTableGetSchema(_ gTable: UnsafeMutablePointer<GArrowTable>) throws -> [String] {
    let schema = garrow_table_get_schema(gTable)
    let numFields = garrow_schema_n_fields(schema)
    let fields = garrow_schema_get_fields(schema)
    if var fields = fields {
        var columnNames: [String] = []
        for i in 0..<numFields {
            let fieldName = garrow_field_get_name(GARROW_FIELD(fields.pointee.data))
            if let fieldName = fieldName {
                let string = String(cString: fieldName)
                columnNames.append(string)
            } else {
                throw ArrowError.invalidFields("Couldn't get field name at index \(i)")
            }
            if i < numFields - 1 {
                fields = fields.pointee.next
            }
        }
        return columnNames
    }
    throw ArrowError.invalidFields("Could not get fields from schema")
}
