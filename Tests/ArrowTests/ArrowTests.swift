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
                let columns = try gArrowTableToSwift(gTable: table)
                let column0 = columns[0]
                if let column0 = column0 as? [Date], let values1 = values1 as? [Date] {
                    XCTAssertTrue(Date.datesEqual(array1: values1, array2: column0))
                } else if let column0 = column0 as? [T] {
                    XCTAssertEqual(column0, values1)
                } else {
                    assertionFailure()
                }
                let column1 = columns[1]
                if let column1 = column1 as? [Date], let values2 = values2 as? [Date] {
                    XCTAssertTrue(Date.datesEqual(array1: values2, array2: column1))
                } else if let column1 = column1 as? [T] {
                    XCTAssertEqual(column1, values2)
                } else {
                    assertionFailure()
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
            let columns = try gArrowTableToSwift(gTable: gTable)
            let deserializedColumnsNames = try gArrowTableGetSchema(gTable)
            XCTAssertEqual(deserializedColumnsNames, columnNames)
            let column0 = columns[0]
            if let column0 = column0 as? [Date], let values1 = values1 as? [Date] {
                XCTAssertTrue(Date.datesEqual(array1: values1, array2: column0))
            } else if let column0 = column0 as? [T] {
                XCTAssertEqual(column0, values1)
            } else {
                assertionFailure()
            }
            let column1 = columns[1]
            if let column1 = column1 as? [Date], let values2 = values2 as? [Date] {
                print(values2)
                print(column1)
                XCTAssertTrue(Date.datesEqual(array1: values2, array2: column1))
            } else if let column1 = column1 as? [T] {
                XCTAssertEqual(column1, values2)
            } else {
                assertionFailure()
            }
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
        /*let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", false, "asf"]*/
        /*let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80", true, "asdf"]*/
        let column1: [String] = ["e12fe9879b95b35479a1195bd2190b10", "02528b1bca6c637a9d725488efa1de80", "bar"]
        let column2: [String] = ["test", "test2", "foo"]
        let column3: [String] = ["asf", "asdf", "asdfasd"]
        var columns: ArrowColumns = ArrowColumns()
        let columnNames = ["id", "stuff", "stuff2"]
        columns.addStringColumn(column: column1, columnName: columnNames[0])
        columns.addStringColumn(column: column2, columnName: columnNames[1])
        columns.addStringColumn(column: column3, columnName: columnNames[2])
        try columns.saveColumnsToFeather(outputPath: "tableSingle.feather")
        /*let rows = [row1, row2]*/
        /*if let rows = rows as? [[BaseArrowArrayElement]] {*/
            /*try saveRowsToFeather(rows: rows, columnNames: columnNames, outputPath: "tableSingle.feather")*/
        /*} else {*/
            /*fatalError()*/
        /*}*/
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
        let columnNames = ["id", "ask", "time", "prohibited"]
        let columns = rows.transposed()
        var arrowColumns = ArrowColumns()
        arrowColumns.addStringColumn(column: columns[0] as! [String], columnName: columnNames[0])
        arrowColumns.addDoubleColumn(column: columns[1] as! [Double], columnName: columnNames[1])
        arrowColumns.addDateColumn(column: columns[2] as! [Date], columnName: columnNames[2])
        arrowColumns.addBoolColumn(column: columns[3] as! [Bool], columnName: columnNames[3])
        try arrowColumns.saveColumnsToFeather(outputPath: filePath)

        let (columnsDecoded, columnNamesDecoded) = try readColumnsFromFeather(filePath: filePath)
        XCTAssertEqual(columnsDecoded[1][2] as? Double, 879.5)
        XCTAssertEqual(columnNamesDecoded, columnNames)
    }

    func testDateNanosecondsConversion() throws {
        // TODO: The below test is not guaranteed to succeed. Sometimes it passes and sometimes it doesn't due to
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

    func testMultiChunkArrays() {
        let numRows = 100_000
        let randomColumnValues1: [Double] = (0..<numRows).map { Double.random(in: 0.0...Double($0)) }
        let randomColumnValues2: [Int] = (0..<numRows).map { Int.random(in: 0...$0) }
        var longColumnTable: ArrowColumns = ArrowColumns()
        let columnNames = ["Test 42 Column", "Test Long Column of Ints"]
        longColumnTable.addDoubleColumn(column: randomColumnValues1, columnName: columnNames[0])
        longColumnTable.addIntColumn(column: randomColumnValues2, columnName: columnNames[1])
        do {
            let filePath = "./longColumnTable.feather"
            try longColumnTable.saveColumnsToFeather(outputPath: filePath)
            let (decodedColumns, decodedColumnNames) = try readColumnsFromFeather(filePath: filePath)
            XCTAssertEqual(decodedColumns[0].count, numRows)
            XCTAssertEqual(decodedColumns[1].count, numRows)
            XCTAssertEqual(decodedColumnNames, columnNames)
            guard let doubleColumn = decodedColumns[0] as? [Double] else {
                assertionFailure("Couldn't decode column as Doubles")
                return
            }
            XCTAssertEqual(doubleColumn, randomColumnValues1)
            guard let intColumn = decodedColumns[1] as? [Int] else {
                assertionFailure("Couldn't decode column as Int")
                return
            }
            XCTAssertEqual(intColumn, randomColumnValues2)
        } catch {
            print("Failed")
        }
    }

    /*func testLargeColumns() {*/
        /*let numRows = 5_000_000*/
        /*print(Date(), getMemoryUsageString()!, "Creating random large column values...")*/
        /*[>XCTAssertTrue(getMemoryUsage()! < 40_000_000)<]*/
        /*let doublesColumn: [Double] = (0..<numRows).map { Double.random(in: 0.0...Double($0)) }*/
        /*let intsColumn: [Int64] = (0..<numRows).map { Int64.random(in: Int64(0)...Int64($0)) }*/

        /*var largeColumns: ArrowColumns = ArrowColumns()*/
        /*let columnNames: [String] = ["doubles", "ints"]*/
        /*largeColumns.addDoubleColumn(column: doublesColumn, columnName: columnNames[0])*/
        /*largeColumns.addInt64Column(column: intsColumn, columnName: columnNames[1])*/

        /*let filePath: String = "./data/swiftArrowLargeColumnsTest.feather"*/
        /*print(Date(), getMemoryUsageString()!, "Saving large columns to .feather...")*/
        /*do {*/
            /*try largeColumns.saveColumnsToFeather(outputPath: filePath)*/
            /*print(Date(), getMemoryUsageString()!, "Done saving to .feather.")*/
        /*} catch {*/
            /*print(error)*/
        /*}*/
        /*do {*/
            /*print(Date(), getMemoryUsageString()!, "Reading from .feather...")*/
            /*let (decodedColumns, decodedColumnNames) = try readColumnsFromFeather(filePath: filePath)*/
            /*print(Date(), getMemoryUsageString()!, "Done reading from .feather.")*/
            /*XCTAssertEqual(decodedColumnNames, columnNames)*/
            /*print("num rows read:", decodedColumns[0].count)*/
        /*} catch {*/
            /*print(error)*/
        /*}*/
    /*}*/

    func testBasicMemoryUsage() {
        let swiftTable: ArrowColumns = { () -> ArrowColumns in
            print(Date(), getMemoryUsageString()!, "Creating random large column values...")
            XCTAssertTrue(getMemoryUsage()! < 30_000_000)
            let numRows = 1_000_000
            let doublesColumn: [Double] = (0..<numRows).concurrentMap { Double.random(in: 0.0...Double($0)) }
            let intsColumn: [Int64] = (0..<numRows).concurrentMap { Int64.random(in: Int64(0)...Int64($0)) }
            print(intsColumn.count, doublesColumn.count)
            print(Date(), getMemoryUsageString()!, "Done creating random columns")
            XCTAssertTrue(getMemoryUsage()! <= 30_000_000 + 16_000_000 + 5_000_000)
            var largeColumns: ArrowColumns = ArrowColumns()
            largeColumns.addInt64Column(column: intsColumn, columnName: "test_ints")
            largeColumns.addDoubleColumn(column: doublesColumn, columnName: "test_doubles")
            print(Date(), getMemoryUsageString()!, "Done creating array of arrays")
            XCTAssertTrue(getMemoryUsage()! <= 30_000_000 + 16_000_000 + 5_000_000)
            return largeColumns
        }()
        print(swiftTable.rowCount)
        print(Date(), getMemoryUsageString()!, "Outside of closure")
        XCTAssertTrue(getMemoryUsage()! <= 30_000_000 + 16_000_000 + 5_000_000)
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
        ("testSwiftMultipleTypesMatrixToFile", testSwiftMultipleTypesMatrixToFile),
        ("testMultiChunkArrays", testMultiChunkArrays),
        /*("testLargeColumns", testLargeColumns)*/
        ("testBasicMemoryUsage", testBasicMemoryUsage)
    ]
}
