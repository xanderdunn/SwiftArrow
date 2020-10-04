import XCTest
import class Foundation.Bundle

@testable import Arrow

final class ArrowLibTests: XCTestCase {

    func testCreateAndSaveToFile<T: ArrowArrayElement>(values1: [T], values2: [T], columnNames: [String]) throws {
        print("Creating arrays, table from arrays, and saving table to .feather file:")
        // Create arrays
        if let result = try T.self.toGArrowArray(array: values1),
           let result2 = try T.self.toGArrowArray(array: values2) {
            let valuesDecoded: [T] = T.self.fromGArrowArray(result)
            XCTAssertEqual(valuesDecoded, values1)
            let values2Decoded: [T] = T.self.fromGArrowArray(result2)
            XCTAssertEqual(values2Decoded, values2)
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: columnNames)
            if let table = table {
                print("Columns of created table:")
                let deserializedColumnsNames = try gArrowTableGetSchema(table)
                let columns = try gArrowTableToSwift(gTable: table)
                try printTable(columns: columns, columnNames: deserializedColumnsNames)
            }
            // Save Table to feather file
            let outputPath = "./test\(T.self).feather"
            if let table = table {
                let column0: [T] = try gArrowTableColumnToSwift(gTable: table, column: 0)
                XCTAssertEqual(column0, values1)
                let column1: [T] = try gArrowTableColumnToSwift(gTable: table, column: 1)
                XCTAssertEqual(column1, values2)
                try saveGTableToFeather(table, outputPath: outputPath)
                print("Saved to \(outputPath)")
            }
        }
    }

    func testLoadFromFile<T: ArrowArrayElement>(values1: [T], values2: [T], columnNames: [String]) throws {
        print("Loading feather file from disk and printing a column:")
        let filePath = "./test\(T.self).feather"
        let gTable = try loadGTableFromFeather(filePath: filePath)
        if let gTable = gTable {
            let deserializedColumnsNames = try gArrowTableGetSchema(gTable)
            XCTAssertEqual(deserializedColumnsNames, columnNames)
            let column0: [T] = try gArrowTableColumnToSwift(gTable: gTable, column: 0)
            XCTAssertEqual(column0, values1)
            let column1: [T] = try gArrowTableColumnToSwift(gTable: gTable, column: 1)
            XCTAssertEqual(column1, values2)
            let columns = try gArrowTableToSwift(gTable: gTable)
            try printTable(columns: columns, columnNames: deserializedColumnsNames)
        }
    }

    let doubleValues1: [Double] = [1.0, 2.22, 45.66, 916661.17171]
    let doubleValues2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]
    let doubleColumnNames = ["doublesColumn1", "doublesColumn2"]

    func testCreateAndSaveDoublesToFile() throws {
        try testCreateAndSaveToFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
    }

    func testLoadDoublesFromFile() throws {
        try testLoadFromFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
    }

    let floatsValues1: [Float] = [1.0, 2.22, 45.66, 916661.17171]
    let floatsValues2: [Float] = [23.7777777, 233.3, 2323.3, 23233.3]
    let floatsColumnNames = ["floatsColumn1", "floatsColumn2"]

    func testCreateAndSaveFloatsToFile() throws {
        try testCreateAndSaveToFile(values1: floatsValues1, values2: floatsValues2, columnNames: floatsColumnNames)
    }

    func testLoadFloatsFromFile() throws {
        try testLoadFromFile(values1: floatsValues1, values2: floatsValues2, columnNames: floatsColumnNames)
    }

    let stringValues1 = ["asdf", "091y", "asljh", "OOOJJJ"]
    let stringValues2 = ["23.7777777", "LKJA>>>>¿", "]}[🎉pp]", ":qjbb❗️"]
    let stringColumnNames = ["stringsColumn1", "stringsColumn2"]

    func testCreateAndSaveStringsToFile() throws {
        try testCreateAndSaveToFile(values1: stringValues1, values2: stringValues2, columnNames: stringColumnNames)
    }

    func testLoadStringFromFile() throws {
        try testLoadFromFile(values1: stringValues1, values2: stringValues2, columnNames: stringColumnNames)
    }

    static var allTests = [
        ("testCreateAndSaveDoublesToFile", testCreateAndSaveDoublesToFile),
        ("testLoadDoublesFromFile", testLoadDoublesFromFile),
        ("testCreateAndSaveFloatsToFile", testCreateAndSaveFloatsToFile),
        ("testLoadFloatsFromFile", testLoadFloatsFromFile),
        ("testCreateAndSaveStringsToFile", testCreateAndSaveStringsToFile),
        ("testLoadStringFromFile", testLoadStringFromFile)
    ]
}
