import XCTest
import class Foundation.Bundle

@testable import Arrow

final class ArrowLibTests: XCTestCase {

    let columnNames: [String] = ["column1", "column2"]

    func testCreateAndSaveToFile<T: ArrowSupportedType>(values1: [T], values2: [T], type: T.Type) throws {
        print("Creating arrays, table from arrays, and saving table to .feather file:")
        // Create arrays
        if let result = try arrayToGArray(values: values1),
           let result2 = try arrayToGArray(values: values2) {
            let valuesDecoded: [T] = try gArrowArrayToSwift(result)
            XCTAssertEqual(valuesDecoded, values1)
            let values2Decoded: [T] = try gArrowArrayToSwift(result2)
            XCTAssertEqual(values2Decoded, values2)
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: columnNames)
            if let table = table {
                print("Columns of created table:")
                try printTable(gTable: table)
            }
            // Save Table to feather file
            let outputPath = "./test\(type).feather"
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


    /*func testCreateAndSaveStringsToFile() throws {*/
        /*try testCreateAndSaveToFile(values1: doubleValues1, values2: doubleValues2, type: String.self)*/
    /*}*/

    func testLoadFromFile<T: ArrowSupportedType>(values1: [T], values2: [T], type: T.Type) throws {
        print("Loading feather file from disk and printing a column:")
        let filePath = "./test\(type).feather"
        let table = try loadGTableFromFeather(filePath: filePath)
        if let table = table {
            let columns = try gArrowTableGetSchema(table)
            XCTAssertEqual(columns, columnNames)
            print("columns: \(columns)")
            let column0: [T] = try gArrowTableColumnToSwift(gTable: table, column: 0)
            XCTAssertEqual(column0, values1)
            let column1: [T] = try gArrowTableColumnToSwift(gTable: table, column: 1)
            XCTAssertEqual(column1, values2)
            try printTable(gTable: table)
        }
    }

    let doubleValues1: [Double] = [1.0, 2.22, 45.66, 916661.17171]
    let doubleValues2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]

    func testCreateAndSaveDoublesToFile() throws {
        try testCreateAndSaveToFile(values1: doubleValues1, values2: doubleValues2, type: Double.self)
    }

    func testLoadDoublesFromFile() throws {
        try testLoadFromFile(values1: doubleValues1, values2: doubleValues2, type: Double.self)
    }

    let stringValues1 = ["asdf", "091y", "asljh", "OOOJJJ"]
    let stringValues2 = ["23.7777777", "LKJA>>><", "]}[pp]", ":qjbb"]

    /*func testLoadStringFromFile() throws {*/
        /*try testLoadFromFile(values1: stringValues1, values2: stringValues2, type: String.self)*/
    /*}*/

    static var allTests = [
        ("testCreateAndSaveDoublesToFile", testCreateAndSaveDoublesToFile),
        ("testLoadDoublesFromFile", testLoadDoublesFromFile),
        /*("testLoadStringFromFile", testLoadStringFromFile),*/
    ]
}
