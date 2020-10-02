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
}

func gArrowArrayToSwift(_ array: UnsafeMutablePointer<GArrowArray>) -> [Double] {
    #if canImport(Darwin)
    let n: Int64 = garrow_array_get_length(array)
    #else
    let n: Int = garrow_array_get_length(array)
    #endif
    var values: [Double] = []
    for i in 0..<n {
        let value: Double = garrow_double_array_get_value(GARROW_DOUBLE_ARRAY(array), i)
        values.append(value)
    }
    return values
}

func gArrowChunkedArrayToGArrow(_ chunkedArray: UnsafeMutablePointer<GArrowChunkedArray>) -> 
                                                                                UnsafeMutablePointer<GArrowArray>? {
    let numChunks = garrow_chunked_array_get_n_chunks(chunkedArray)
    // TODO: Support arbitrary chunks
    assert(numChunks == 1) // Only support single chunk arrays right now
    let gArrowArray = garrow_chunked_array_get_chunk(chunkedArray, 0)
    return gArrowArray
}

func doubleArrayToGArray(values: [Double]) throws -> UnsafeMutablePointer<GArrowArray>? {
    if let arrayBuilder = garrow_double_array_builder_new() {
        var values = values
        var error: UnsafeMutablePointer<GError>? = nil
        var result: gboolean
        #if canImport(Darwin)
        let numValues: Int64 = Int64(values.count)
        #else
        let numValues: Int = values.count
        #endif
        result = garrow_double_array_builder_append_values(arrayBuilder, &values, numValues, [], 0, &error)
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

/**
GList usage from here: https://github.com/apache/arrow/blob/master/c_glib/arrow-glib/schema.cpp#L241-L247
*/
func gArraysToGTable(arrays: [UnsafeMutablePointer<GArrowArray>?],
                     columns: [String]) throws -> UnsafeMutablePointer<GArrowTable>? {
    assert(arrays.count == columns.count)
    var fields: UnsafeMutablePointer<GList>? = nil
    for column in columns {
        let cString = column.cString(using: .utf8)
        let field = garrow_field_new(cString, GARROW_DATA_TYPE(garrow_double_data_type_new()))
        fields = g_list_prepend(fields, field)
    }
    fields = g_list_reverse(fields)
    let schema = garrow_schema_new(fields)
    var error: UnsafeMutablePointer<GError>? = nil
    var arrays = arrays
    let table = garrow_table_new_arrays(schema, &arrays, 2, &error)
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
    var error: UnsafeMutablePointer<GError>? = nil
    // TODO: How do I turn on compression?
    let properties = garrow_feather_write_properties_new()
    let path = outputPath.cString(using: .utf8)
    let output = garrow_file_output_stream_new(path, 0, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        g_object_unref(output)
        g_object_unref(properties)
        throw ArrowError.invalidTableCreation(errorString)
    }
    let result: gboolean = garrow_table_write_as_feather(gTable, GARROW_OUTPUT_STREAM(output), properties, &error)
    if result == 0 {
        let errorString: String = error != nil ? String(cString: error!.pointee.message) : ""
        g_error_free(error)
        g_object_unref(output)
        g_object_unref(properties)
        throw ArrowError.invalidTableCreation(errorString)
    }
    g_object_unref(output)
    g_object_unref(properties)
}

/**
Load table from file: GArrowFeatherFileReader
*/
func loadGTableFromFeather(filePath: String) throws -> UnsafeMutablePointer<GArrowTable>? {
    var error: UnsafeMutablePointer<GError>? = nil
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

func testCreateAndSaveToFile() {
    print("Creating arrays, table from arrays, and saving table to .feather file:")
    do {
        // Create arrays
        let values: [Double] = [1.0, 2.22, 45.66, 916661.17171]
        let values2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]
        if let result = try doubleArrayToGArray(values: values), let result2 = try doubleArrayToGArray(values: values2) {
            let values = gArrowArrayToSwift(result)
            let values2 = gArrowArrayToSwift(result2)
            print(values)
            print(values2)
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: ["result", "result2"])
            if let table = table {
                print("Columns of created table:")
                try printTable(gTable: table)
            }
            // Save Table to feather file
            let outputPath = "./test.feather"
            if let table = table {
                try saveGTableToFeather(table, outputPath: outputPath)
                print("Saved to \(outputPath)")
            }
        }
    } catch {
        print("Failed \(error)")
    }
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

func gArrowTableColumnToSwift(gTable: UnsafeMutablePointer<GArrowTable>, column: Int32) throws -> [Double] {
    if let chunkedArray = garrow_table_get_column_data(gTable, column),
       let gArray = gArrowChunkedArrayToGArrow(chunkedArray) {
           return gArrowArrayToSwift(gArray)
    }
    throw ArrowError.failedRead("Couldn't get column from GArrowTable")
}

// TODO: Only print the first n rows
func printTable(gTable: UnsafeMutablePointer<GArrowTable>) throws {
    let numColumns = garrow_table_get_n_columns(gTable)
    for i in 0..<numColumns {
        let swiftArray = try gArrowTableColumnToSwift(gTable: gTable, column: Int32(i))
        print(swiftArray)
    }
}

func testLoadFromFile() {
    print("Loading feather file from disk and printing a column:")
    let filePath = "./test.feather"
    do {
        let table = try loadGTableFromFeather(filePath: filePath)
        if let table = table {
            let columns = try gArrowTableGetSchema(table)
            print("columns: \(columns)")
            try printTable(gTable: table)
        }
    } catch {
        print("Failed to load table \(error)")
    }
}

func main() {
    testCreateAndSaveToFile()
    /*testLoadFromFile()*/
}

// TODO: Expand types that can be handled to String, Int, and Bool

main()
