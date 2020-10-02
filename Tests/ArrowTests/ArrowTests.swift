import XCTest
import class Foundation.Bundle

@testable import Arrow

final class ArrowLibTests: XCTestCase {

    let values: [Double] = [1.0, 2.22, 45.66, 916661.17171]
    let values2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]
    let columnNames: [String] = ["result", "result2"]

    func testCreateAndSaveToFile() {
        print("Creating arrays, table from arrays, and saving table to .feather file:")
        do {
            // Create arrays
            if let result = try doubleArrayToGArray(values: values),
               let result2 = try doubleArrayToGArray(values: values2) {
                let valuesDecoded = gArrowArrayToSwift(result)
                XCTAssertEqual(valuesDecoded, values)
                let values2Decoded = gArrowArrayToSwift(result2)
                XCTAssertEqual(values2Decoded, values2)
                print(values)
                print(values2)
                // Create table from arrays
                let table = try gArraysToGTable(arrays: [result, result2], columns: columnNames)
                if let table = table {
                    print("Columns of created table:")
                    try printTable(gTable: table)
                }
                // Save Table to feather file
                let outputPath = "./test.feather"
                if let table = table {
                    let column0 = try gArrowTableColumnToSwift(gTable: table, column: 0)
                    XCTAssertEqual(column0, values)
                    let column1 = try gArrowTableColumnToSwift(gTable: table, column: 1)
                    XCTAssertEqual(column1, values2)
                    try saveGTableToFeather(table, outputPath: outputPath)
                    print("Saved to \(outputPath)")
                }
            }
        } catch {
            print("Failed \(error)")
        }
    }

    func testLoadFromFile() {
        print("Loading feather file from disk and printing a column:")
        let filePath = "./test.feather"
        do {
            let table = try loadGTableFromFeather(filePath: filePath)
            if let table = table {
                let columns = try gArrowTableGetSchema(table)
                XCTAssertEqual(columns, columnNames)
                print("columns: \(columns)")
                let column0 = try gArrowTableColumnToSwift(gTable: table, column: 0)
                XCTAssertEqual(column0, values)
                let column1 = try gArrowTableColumnToSwift(gTable: table, column: 1)
                XCTAssertEqual(column1, values2)
                try printTable(gTable: table)
            }
        } catch {
            print("Failed to load table \(error)")
        }
    }

    static var allTests = [
        ("testCreateAndSaveToFile", testCreateAndSaveToFile),
        ("testLoadFromFile", testCreateAndSaveToFile),
    ]
}
