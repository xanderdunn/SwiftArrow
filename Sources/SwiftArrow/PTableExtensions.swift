import PenguinTables

#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

public extension PTable { // Save PTable to .feather file
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

extension PTable { // Read PTable from .feather

    public init(fromFeather filePath: String) throws {
        let gTable = try loadGTableFromFeather(filePath: filePath)
        if let gTable = gTable {
            self = try PTable(gTable)
        } else {
            throw ArrowError.failedRead("Failed to read .feather file from \(filePath)")
        }
    }

    public init(_ gTable: UnsafeMutablePointer<GArrowTable>) throws {
        let numColumns = Int(garrow_table_get_n_columns(gTable))
        var error: UnsafeMutablePointer<GError>?
        let columnNames = try gArrowTableGetSchema(gTable)
        // TODO: This doubles memory usage. Instead of doing this, I should iterate through chunks
        let gTable = garrow_table_combine_chunks(gTable, &error)
        if let error = error {
            let errorString: String = String(cString: error.pointee.message)
            g_error_free(error)
            throw ArrowError.invalidTableCreation(errorString)
        }

        var columns: [String: PColumn] = [:]

        for i in 0..<numColumns {
            if let gTable = gTable, let chunkedArray = garrow_table_get_column_data(gTable, Int32(i)) {
                let gArrays = gArrowChunkedArrayToGArrow(chunkedArray)
                let dataType = garrow_chunked_array_get_value_data_type(chunkedArray)
                if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_double_data_type_new())) == 1 {
                    var result: [Double] = []
                    for gArray in gArrays {
                        guard let swiftArray: [Double] = Array(gArray: gArray) else {
                            throw ArrowError.invalidArrayCreation("Couldn't convert Doubles GArrowArray to Swift Array")
                        }
                        result.append(contentsOf: swiftArray)
                    }
                    columns[columnNames[i]] = PColumn(result)
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_string_data_type_new())) == 1 {
                    var result: [String] = []
                    for gArray in gArrays {
                        if let gArray = gArray {
                            let swiftArray: [String] = gArrowTableColumnToSwift(gArray: gArray)
                            result.append(contentsOf: swiftArray)
                        } else {
                            throw ArrowError.invalidArrayCreation("Got nil GArray")
                        }
                    }
                    columns[columnNames[i]] = PColumn(result)
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_int64_data_type_new())) == 1 {
                    var result: [Int] = []
                    for gArray in gArrays {
                        guard let swiftArray: [Int] = Array(gArray: gArray) else {
                            throw ArrowError.invalidArrayCreation("Couldn't convert Ints GArrowArray to Swift Array")
                        }
                        result.append(contentsOf: swiftArray)
                    }
                    let column: PColumn = PColumn(result)
                    columns[columnNames[i]] = column
                } else if garrow_data_type_equal(dataType, GARROW_DATA_TYPE(garrow_boolean_data_type_new())) == 1 {
                    var result: [Bool] = []
                    for gArray in gArrays {
                        if let gArray = gArray {
                            let swiftArray: [Bool] = gArrowTableColumnToSwift(gArray: gArray)
                            result.append(contentsOf: swiftArray)
                        } else {
                            throw ArrowError.invalidArrayCreation("Got nil GArray")
                        }
                    }
                    let column: PColumn = PColumn(result)
                    columns[columnNames[i]] = column
                } else {
                    var errorString = "Got GArrowArray with unsupported data type in call gArrowTableToSwift"
                    if let typeString = garrow_data_type_to_string(dataType) {
                        let swiftTypeString = String(cString: typeString)
                        errorString += ": \(swiftTypeString)"
                    }
                    throw ArrowError.unsupportedDataType(errorString)
                }
            } else {
                throw ArrowError.invalidArrayCreation("Couldn't get GArrowArray from GArrowTable")
            }
        }
        self = try PTable(columns)
    }
}
