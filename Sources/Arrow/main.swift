import Foundation
import CArrow

/*func createSchema(columns: [String]) {*/
    /*if let gArrowSchema = garrow_schema_new(columns) {*/
        /*print(gArrowSchema)*/
    /*}*/
/*}*/

enum ArrowError: Error {
    case invalidArrayCreation(String)
    case invalidTableCreation(String)
    case failedFeatherSave(String)
}

func gArrowArrayToSwift(_ array: UnsafeMutablePointer<GArrowArray>) -> [Double] {
    let n: Int64 = garrow_array_get_length(array)
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
    print(numChunks)
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
        result = garrow_double_array_builder_append_values(arrayBuilder, &values, Int64(values.count), [], 0, &error)
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

func testCreateAndSaveToFile() {
    do {
        // Create arrays
        let values: [Double] = [1.0, 2.22, 45.66, 916661.17171]
        let values2: [Double] = [23.3, 233.3, 2323.3, 23233.3]
        if let result = try doubleArrayToGArray(values: values), let result2 = try doubleArrayToGArray(values: values2) {
            let values = gArrowArrayToSwift(result)
            let values2 = gArrowArrayToSwift(result2)
            print(values)
            print(values2)
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: ["result", "result2"])
            let iTHColumn: Int32 = 1
            if let tableArray0 = garrow_table_get_column_data(table, iTHColumn),
               let gArray = gArrowChunkedArrayToGArrow(tableArray0) {
                   print("\(iTHColumn)th column pulled from table:", gArrowArrayToSwift(gArray))
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

func testLoadFromFile() {
}

func main() {
    print("Start")
    testCreateAndSaveToFile()
    // TODO: Load table from file: GArrowFeatherFileReader
    print("Done")
}

main()
