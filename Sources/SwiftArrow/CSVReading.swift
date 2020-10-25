#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

public func readCSVs(paths: [String]) throws -> UnsafeMutablePointer<GArrowTable>? {
    var error: UnsafeMutablePointer<GError>?
    var tables: [UnsafeMutablePointer<GArrowTable>?] = []
    // TODO: Parallelize this for loop
    for path in paths {
        try tables.append(readCSV(path: path))
    }
    var tablesList: UnsafeMutablePointer<GList>?
    for table in tables.dropFirst() {
        tablesList = g_list_append(tablesList, table)
    }
    let fullTable = garrow_table_concatenate(tables[0], tablesList, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidInputStream(errorString)
    }
    return fullTable
}

public func readCSV(path: String) throws -> UnsafeMutablePointer<GArrowTable>? {
    var error: UnsafeMutablePointer<GError>?

    var inputStream = GARROW_INPUT_STREAM(garrow_memory_mapped_input_stream_new(path, &error))
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidInputStream(errorString)
    }
    let csvOptions = garrow_csv_read_options_new()

    if path.hasSuffix("gz") {
        let codec = garrow_codec_new(GARROW_COMPRESSION_TYPE_GZIP, &error)
        if let error = error {
            let errorString: String = String(cString: error.pointee.message)
            g_error_free(error)
            throw ArrowError.invalidInputStream(errorString)
        }
        inputStream = GARROW_INPUT_STREAM(garrow_compressed_input_stream_new(codec, inputStream, &error))
        if let error = error {
            let errorString: String = String(cString: error.pointee.message)
            g_error_free(error)
            throw ArrowError.invalidInputStream(errorString)
        }
    }

    let reader = garrow_csv_reader_new(GARROW_INPUT_STREAM(inputStream), csvOptions, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidInputStream(errorString)
    }
    let table = garrow_csv_reader_read(reader, &error)
    if let error = error {
        let errorString: String = String(cString: error.pointee.message)
        g_error_free(error)
        throw ArrowError.invalidInputStream(errorString)
    }
    return table
}
