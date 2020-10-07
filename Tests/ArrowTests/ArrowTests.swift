import XCTest
import class Foundation.Bundle

@testable import SwiftArrow

final class ArrowLibTests: XCTestCase {
    // TODO: In setUP and tear down, delete all .feather files

    func testCreateAndSaveToFile<T: ArrowArrayElement>(values1: [T], values2: [T], columnNames: [String]) throws {
        print("Creating arrays, table from arrays, and saving table to .feather file:")
        // Create arrays
        if let result = try T.self.toGArrowArray(array: values1),
           let result2 = try T.self.toGArrowArray(array: values2) {
            let valuesDecoded: [T] = T.self.fromGArrowArray(result)
            if let valuesDecoded = valuesDecoded as? [Date], let values1 = values1 as? [Date] {
                XCTAssertTrue(Date.datesEqual(array1: valuesDecoded, array2: values1))
            } else {
                XCTAssertEqual(valuesDecoded, values1)
            }
            let values2Decoded: [T] = T.self.fromGArrowArray(result2)
            if let values2Decoded = values2Decoded as? [Date], let values2 = values2 as? [Date] {
                XCTAssertTrue(Date.datesEqual(array1: values2Decoded, array2: values2))
            } else {
                XCTAssertEqual(values2Decoded, values2)
            }
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: columnNames)
            if let table = table {
                print("Columns of created table:")
                let deserializedColumnsNames = try gArrowTableGetSchema(table)
                let columns = try gArrowTableToSwift(gTable: table)
                printTable(columns: columns, columnNames: deserializedColumnsNames)
            }
            // Save Table to feather file
            let outputPath = "./test\(T.self).feather"
            if let table = table {
                let column0: [T] = try gArrowTableColumnToSwift(gTable: table, column: 0)
                if let column0 = column0 as? [Date], let values1 = values1 as? [Date] {
                    XCTAssertTrue(Date.datesEqual(array1: values1, array2: column0))
                } else {
                    XCTAssertEqual(column0, values1)
                }
                let column1: [T] = try gArrowTableColumnToSwift(gTable: table, column: 1)
                if let column1 = column1 as? [Date], let values2 = values2 as? [Date] {
                    XCTAssertTrue(Date.datesEqual(array1: values2, array2: column1))
                } else {
                    XCTAssertEqual(column1, values2)
                }
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
            if let column0 = column0 as? [Date], let values1 = values1 as? [Date] {
                XCTAssertTrue(Date.datesEqual(array1: values1, array2: column0))
            } else {
                XCTAssertEqual(column0, values1)
            }
            let column1: [T] = try gArrowTableColumnToSwift(gTable: gTable, column: 1)
            if let column1 = column1 as? [Date], let values2 = values2 as? [Date] {
                print(values2)
                print(column1)
                XCTAssertTrue(Date.datesEqual(array1: values2, array2: column1))
            } else {
                XCTAssertEqual(column1, values2)
            }
            let columns = try gArrowTableToSwift(gTable: gTable)
            printTable(columns: columns, columnNames: deserializedColumnsNames)
        }
    }

    // DOUBLESs
    let doubleValues1: [Double] = [1.0, 2.22, 45.66, 916661.17171]
    let doubleValues2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]
    let doubleColumnNames = ["doublesColumn1", "doublesColumn2"]

    func testCreateAndSaveDoublesToFile() throws {
        try testCreateAndSaveToFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
    }

    func testLoadDoublesFromFile() throws {
        try testLoadFromFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
    }

    // FLOATS
    let floatsValues1: [Float] = [1.0, 2.22, 45.66, 916661.17171]
    let floatsValues2: [Float] = [23.7777777, 233.3, 2323.3, 23233.3]
    let floatsColumnNames = ["floatsColumn1", "floatsColumn2"]

    func testCreateAndSaveFloatsToFile() throws {
        try testCreateAndSaveToFile(values1: floatsValues1, values2: floatsValues2, columnNames: floatsColumnNames)
    }

    func testLoadFloatsFromFile() throws {
        try testLoadFromFile(values1: floatsValues1, values2: floatsValues2, columnNames: floatsColumnNames)
    }

    // INTs
    let intValues1: [Int] = [1, 222, 4566, 916661]
    let intValues2: [Int] = [237777777, 233, 23233, 232333]
    let intColumnNames = ["intColumn1", "intColumn2"]

    func testCreateAndSaveIntsToFile() throws {
        try testCreateAndSaveToFile(values1: intValues1, values2: intValues2, columnNames: intColumnNames)
    }

    func testLoadIntsFromFile() throws {
        try testLoadFromFile(values1: intValues1, values2: intValues2, columnNames: intColumnNames)
    }

    // BOOLs
    let boolValues1: [Bool] = [true, true, false, false]
    let boolValues2: [Bool] = [false, false, false, true]
    let boolColumnNames = ["boolColumn1", "boolColumn2"]

    func testCreateAndSaveBoolsToFile() throws {
        try testCreateAndSaveToFile(values1: boolValues1, values2: boolValues2, columnNames: boolColumnNames)
    }

    func testLoadBoolsFromFile() throws {
        try testLoadFromFile(values1: boolValues1, values2: boolValues2, columnNames: boolColumnNames)
    }

    // STRINGS
    let stringValues1 = ["asdf", "091y", "asljh", "OOOJJJ"]
    let stringValues2 = ["23.7777777", "LKJA>>>>¿", "]}[🎉pp]", ":qjbb❗️"]
    let stringColumnNames = ["stringsColumn1", "stringsColumn2"]

    func testCreateAndSaveStringsToFile() throws {
        try testCreateAndSaveToFile(values1: stringValues1, values2: stringValues2, columnNames: stringColumnNames)
    }

    func testLoadStringFromFile() throws {
        try testLoadFromFile(values1: stringValues1, values2: stringValues2, columnNames: stringColumnNames)
    }

    // DATETIMEs
    let dateValues1 = [Date(timeIntervalSince1970: 81817171.00001), Date(), Date(timeIntervalSinceNow: 1222222)]
    let dateValues2 = [Date(), Date(timeIntervalSinceNow: -123.88888), Date(timeIntervalSince1970: -888.11413)]
    let dateColumnNames = ["datesColumn1", "datesColumn2"]

    func testCreateAndSaveDatesToFile() throws {
        try testCreateAndSaveToFile(values1: dateValues1, values2: dateValues2, columnNames: dateColumnNames)
    }

    func testLoadDatesFromFile() throws {
        try testLoadFromFile(values1: dateValues1, values2: dateValues2, columnNames: dateColumnNames)
    }

    func testSwiftSingleTypeMatrixToFile() throws {
        let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", false, "asf"]
        let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80", true, "asdf"]
        let column1: [String] = ["e12fe9879b95b35479a1195bd2190b10", "02528b1bca6c637a9d725488efa1de80", "bar"]
        let column2: [String] = ["test", "test2", "foo"]
        let column3: [String] = ["asf", "asdf", "asdfasd"]
        let columns: [[BaseArrowArrayElement]] = [column1, column2, column3]
        let columnNames = ["id", "stuff", "stuff2"]
        try saveColumnsToFeather(columns: columns, columnNames: columnNames, outputPath: "tableSingle.feather")
        let rows = [row1, row2]
        if let rows = rows as? [[BaseArrowArrayElement]] {
            try saveRowsToFeather(rows: rows, columnNames: columnNames, outputPath: "tableSingle.feather")
        } else {
            fatalError()
        }
    }

    func testSwiftMultipleTypesMatrixToFile() throws {
        let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", 2137.8 as Double, Date(), false]
        let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80",
                                             2137.4 as Double,
                                             Date(timeIntervalSinceNow: 1232.22),
                                             true]
        let row3: [Any] = ["1de820d72a41bf02fdc55a8991797991", 879.5 as Double, Date(), true]
        let rows = [row1, row2, row3]
        let filePath = "tableMultiple.feather"
        if let rows = rows as? [[BaseArrowArrayElement]] {
            try saveRowsToFeather(rows: rows, columnNames: ["id", "ask", "time", "prohibited"], outputPath: filePath)
        } else {
            fatalError()
        }

        let columnsDecoded = try readColumnsFromFeather(filePath: filePath)
        XCTAssertEqual(columnsDecoded[1][2] as? Double, 879.5)
    }

    func testDateNanosecondsConversion() throws {
        // TODO: The below test is not guaranteed to suceed. Sometimes it passes and sometimes it doesn't due to
        //  floating point imprecision. See issue #1: https://github.com/xanderdunn/SwiftArrow/issues/1
        /*let date = Date()*/
        /*let nanoseconds = date.nanosecondsSince1970*/
        /*let decodedDate = Date(nanoseconds: nanoseconds)*/
        /*XCTAssertEqual(date, decodedDate)*/

        let epochDateFromNanoseconds = Date(nanoseconds: 0)
        let epochDateFromSeconds = Date(timeIntervalSince1970: 0.0)
        XCTAssertEqual(epochDateFromSeconds, epochDateFromNanoseconds)
    }

    func testDateComparisons() throws {
        let dates1 = [Date(),
                      Date(timeIntervalSinceNow: 12342.9222),
                      Date(timeIntervalSinceNow: -1234.444),
                      Date(timeIntervalSince1970: -12341234.224234)]
        let dates2 = dates1
        let dates3 = [Date(),
                      Date(timeIntervalSinceNow: 12342.921),
                      Date(timeIntervalSinceNow: -1234.444),
                      Date(timeIntervalSince1970: -12341234.224234)]

        XCTAssertTrue(Date.datesEqual(array1: dates1, array2: dates2))
        XCTAssertFalse(Date.datesEqual(array1: dates1, array2: dates3))
    }

    static var allTests = [
        ("testCreateAndSaveDoublesToFile", testCreateAndSaveDoublesToFile),
        ("testLoadDoublesFromFile", testLoadDoublesFromFile),
        ("testCreateAndSaveFloatsToFile", testCreateAndSaveFloatsToFile),
        ("testLoadFloatsFromFile", testLoadFloatsFromFile),
        ("testCreateAndSaveIntsToFile", testCreateAndSaveIntsToFile),
        ("testLoadIntsFromFile", testLoadIntsFromFile),
        ("testCreateAndSaveBoolsToFile", testCreateAndSaveBoolsToFile),
        ("testLoadBoolsFromFile", testLoadBoolsFromFile),
        ("testCreateAndSaveStringsToFile", testCreateAndSaveStringsToFile),
        ("testLoadStringFromFile", testLoadStringFromFile),
        ("testCreateAndSaveDatesToFile", testCreateAndSaveDatesToFile),
        ("testLoadDatesFromFile", testLoadDatesFromFile),
        ("testDateNanosecondsConversion", testDateNanosecondsConversion),
        ("testDateComparisons", testDateComparisons),
        ("testSwiftSingleTypeMatrixToFile", testSwiftSingleTypeMatrixToFile),
        ("testSwiftMultipleTypesMatrixToFile", testSwiftMultipleTypesMatrixToFile)
    ]
}
