import XCTest
import PenguinTables
import class Foundation.Bundle
#if canImport(Darwin)
import CArrowMac
#else
import CArrowLinux
#endif

@testable import SwiftArrow

/**
Testing equivalnce including nans
*/
func testArrayEquivalenceWithNan(array1: [Double], array2: PTypedColumn<Double>) -> Bool {
    var result: Bool = true
    if array1.count != array2.count {
        return false
    }
    for (i, element1) in array1.enumerated() {
        let element2 = array2[i]!
        if element1.isNaN && element2.isNaN {
            result = result && true
        } else if element1 == element2 {
            result = result && true
        } else {
            result = false
            break
        }
    }
    return result
}

final class ArrowLibTests: XCTestCase {
    // TODO: In set up and tear down, delete all .feather files

    func testCreateAndSaveToFile<T: ElementRequirements>(values1: [T], values2: [T], columnNames: [String]) throws {
        print("Creating arrays, table from arrays, and saving table to .feather file:")
        // Create arrays
        var result: UnsafeMutablePointer<GArrowArray>?
        var result2: UnsafeMutablePointer<GArrowArray>?
        //TODO: How to clean up this typing mess
        if T.self == String.self {
            let column1: PTypedColumn<String> = try PColumn(values1).asDType()
            let column2: PTypedColumn<String> = try PColumn(values2).asDType()
            result = try column1.toGArrowArray()
            result2 = try column2.toGArrowArray()
        } else if T.self == Double.self {
            let column1: PTypedColumn<Double> = try PColumn(values1).asDType()
            let column2: PTypedColumn<Double> = try PColumn(values2).asDType()
            result = try column1.toGArrowArray()
            result2 = try column2.toGArrowArray()
        } else if T.self == Int.self {
            let column1: PTypedColumn<Int> = try PColumn(values1).asDType()
            let column2: PTypedColumn<Int> = try PColumn(values2).asDType()
            result = try column1.toGArrowArray()
            result2 = try column2.toGArrowArray()
        } else if T.self == Bool.self {
            let column1: PTypedColumn<Bool> = try PColumn(values1).asDType()
            let column2: PTypedColumn<Bool> = try PColumn(values2).asDType()
            result = try column1.toGArrowArray()
            result2 = try column2.toGArrowArray()
        } else {
            throw ArrowError.invalidArrayCreation("")
        }
        if let result = result, let result2 = result2 {
            // Create table from arrays
            let table = try gArraysToGTable(arrays: [result, result2], columns: columnNames)
            if let table = table {
                print("Columns of created table:")
                let deserializedColumnsNames = try gArrowTableGetSchema(table)
                let columns = try PTable(table)
                XCTAssertEqual(deserializedColumnsNames, columnNames)
                let decodedColumn0: PTypedColumn<T> = try columns[columnNames[0]]!.asDType()
                let decodedColumn1: PTypedColumn<T> = try columns[columnNames[1]]!.asDType()
                XCTAssertEqual(decodedColumn0.values, values1)
                XCTAssertEqual(decodedColumn1.values, values2)
            }
            // Save Table to feather file
            let outputPath = "./test\(T.self).feather"
            if let table = table {
                let columns = try PTable(table)
                let column0: PTypedColumn<T> = try columns[columnNames[0]]!.asDType()
                XCTAssertEqual(column0.values, values1)
                let column1: PTypedColumn<T> = try columns[columnNames[1]]!.asDType()
                XCTAssertEqual(column1.values, values2)
                try saveGTableToFeather(table, outputPath: outputPath)
                print("Saved to \(outputPath)")
            }
        }
    }

    func testLoadFromFile<T: ElementRequirements>(values1: [T], values2: [T], columnNames: [String]) throws {
        print("Loading feather file from disk and printing a column:")
        let filePath = "./test\(T.self).feather"
        let gTable = try loadGTableFromFeather(filePath: filePath)
        if let gTable = gTable {
            let columns = try PTable(gTable)
            let deserializedColumnsNames = try gArrowTableGetSchema(gTable)
            XCTAssertEqual(deserializedColumnsNames, columnNames)
            let column0: PTypedColumn<T> = try columns[columnNames[0]]!.asDType()
            XCTAssertEqual(column0.values, values1)
            let column1: PTypedColumn<T> = try columns[columnNames[1]]!.asDType()
            XCTAssertEqual(column1.values, values2)
            // printTable(columns: columns, columnNames: deserializedColumnsNames)
        }
    }

    // DOUBLEs
    let doubleValues1: [Double] = [1.0, 2.22, 45.66, 916661.17171]
    let doubleValues2: [Double] = [23.7777777, 233.3, 2323.3, 23233.3]
    let doubleColumnNames = ["doublesColumn1", "doublesColumn2"]

    func testCreateAndSaveDoublesToFile() throws {
        try testCreateAndSaveToFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
    }

    func testLoadDoublesFromFile() throws {
        try testLoadFromFile(values1: doubleValues1, values2: doubleValues2, columnNames: doubleColumnNames)
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

    func testSwiftSingleTypeMatrixToFile() throws {
        // let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", false, "asf"]
        // let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80", true, "asdf"]
        let columnNames = ["id", "stuff", "stuff2"]
        let column1: [String] = ["e12fe9879b95b35479a1195bd2190b10", "02528b1bca6c637a9d725488efa1de80", "bar"]
        let column2: [String] = ["test", "test2", "foo"]
        let column3: [String] = ["asf", "asdf", "asdfasd"]
        let table: PTable = try PTable([columnNames[0]: PColumn(column1),
                                        columnNames[1]: PColumn(column2),
                                        columnNames[2]: PColumn(column3)])
        try table.toFeather(filePath: "tableSingle.feather")
        //let rows = [row1, row2]
        //if let rows = rows as? [[BaseArrowArrayElement]] {
            //[>try saveRowsToFeather(rows: rows, columnNames: columnNames, outputPath: "tableSingle.feather")<]
        //} else {
            //[>fatalError()
        //}
    }

    func testSwiftMultipleTypesMatrixToFile() throws {
        let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", 2137.8 as Double, false]
        let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80", 2137.4 as Double, true]
        let row3: [Any] = ["1de820d72a41bf02fdc55a8991797991", 879.5 as Double, true]
        let rows = [row1, row2, row3]
        let filePath = "tableMultiple.feather"
        let columnNames = ["id", "ask", "prohibited"]
        let columns = rows.transposed()
        let table = try PTable([columnNames[0]: PColumn(columns[0] as! [String]),
                                columnNames[1]: PColumn(columns[1] as! [Double]),
                                columnNames[2]: PColumn(columns[2] as! [Bool])])
        XCTAssertEqual(table.columnNames, columnNames.sorted())
        try table.toFeather(filePath: filePath)

        let columnsDecoded = try PTable(fromFeather: filePath)
        let doubleColumnDecoded: PTypedColumn<Double> = try columnsDecoded[columnNames[1]]!.asDType()
        XCTAssertEqual(doubleColumnDecoded[2], 879.5)
        XCTAssertEqual(columnsDecoded.columnNames, columnNames.sorted())
    }

    func testMultiChunkArrays() throws {
        let numRows = 100_000
        let randomColumnValues1: [Double] = (0..<numRows).map { Double.random(in: 0.0...Double($0)) }
        let randomColumnValues2: [Int] = (0..<numRows).map { Int.random(in: 0...$0) }
        let columnNames = ["Test 42 Column", "Test Long Column of Ints"]
        let longColumnTable: PTable = try PTable([columnNames[0]: PColumn(randomColumnValues1),
                                              columnNames[1]: PColumn(randomColumnValues2)])
        let filePath = "./longColumnTable.feather"
        try longColumnTable.toFeather(filePath: filePath)
        let decodedColumns = try PTable(fromFeather: filePath)
        XCTAssertEqual(decodedColumns[columnNames[0]]!.count, numRows)
        XCTAssertEqual(decodedColumns[columnNames[1]]!.count, numRows)
        XCTAssertEqual(decodedColumns.columnNames, columnNames)
        let doubleColumn: PTypedColumn<Double> = try decodedColumns[columnNames[0]]!.asDType()
        XCTAssertTrue(testArrayEquivalenceWithNan(array1: randomColumnValues1, array2: doubleColumn))
        let intColumn: PTypedColumn<Int> = try decodedColumns[columnNames[1]]!.asDType()
        XCTAssertEqual(intColumn.values, randomColumnValues2)
    }

    func testLargeColumns() throws {
        let numRows = 5_000_000
        //XCTAssertTrue(getMemoryUsage()! < 40_000_000)
        let initialMemoryUsage = getMemoryUsage()!
        let memoryCushion: UInt64 = 15_000_000
        let dataMemorySize: UInt64 = UInt64(numRows) * 2 * 8 // two columns, 8 bytes per column
        let doublesColumn: [Double] = (0..<numRows).map { Double.random(in: 0.0...Double($0)) }
        let intsColumn: [Int] = (0..<numRows).map { Int.random(in: 0...Int($0)) }
        XCTAssertTrue(getMemoryUsage()! <= initialMemoryUsage + dataMemorySize + memoryCushion)
        XCTAssertTrue(getMemoryUsage()! >= initialMemoryUsage + dataMemorySize - memoryCushion)

        let columnNames: [String] = ["doubles", "ints"]
        let largeColumns: PTable = try PTable(["doubles": PColumn(doublesColumn), "ints": PColumn(intsColumn)])
        XCTAssertTrue(getMemoryUsage()! <= initialMemoryUsage + dataMemorySize + memoryCushion)
        XCTAssertTrue(getMemoryUsage()! >= initialMemoryUsage + dataMemorySize - memoryCushion)

        let filePath: String = "./data/swiftArrowLargeColumnsTest.feather"
        do {
            try largeColumns.toFeather(filePath: filePath)
            // Saving to feather makes a single copy, so 2 * data size (At least it used to with ArrowColumns)
            // TODO: Holy crap why did this go from 2x dataMemorySize to 5x dataMemorySize when I switched to PTable?
            let ceiling = initialMemoryUsage + 5 * dataMemorySize + memoryCushion
            XCTAssertTrue(getMemoryUsage()! <= ceiling)
        }
        do {
            var ceiling = initialMemoryUsage + 5 * dataMemorySize + memoryCushion
            XCTAssertTrue(getMemoryUsage()! <= ceiling)
            let columns = try PTable(fromFeather: filePath)
            // TODO: The goal is to reduce this by 1x size of the dataset
            // https://github.com/xanderdunn/SwiftArrow/issues/7
            ceiling = initialMemoryUsage + 7 * dataMemorySize + memoryCushion
            XCTAssertTrue(getMemoryUsage()! <= ceiling)
            XCTAssertEqual(columns.columnNames, columnNames)
            XCTAssertEqual(columns[columnNames[0]]!.count, numRows)
        }
    }

    func testBasicMemoryUsage() throws {
        let numRows: UInt64 = 1_000_000
        let memoryCushion: UInt64 = 5_000_000
        let dataMemorySize: UInt64 = 2 * 8 * numRows
        let initialMemoryUsage = getMemoryUsage()!
        let swiftTable: PTable = try { () -> PTable in
            let doublesColumn: [Double] = (0..<numRows).concurrentMap { Double.random(in: 0.0...Double($0)) }
            let intsColumn: [Int] = (0..<numRows).concurrentMap { Int.random(in: 0...Int($0)) }
            XCTAssertEqual(UInt64(intsColumn.count), numRows)
            XCTAssertEqual(UInt64(doublesColumn.count), numRows)
            let ceiling = initialMemoryUsage + dataMemorySize + memoryCushion
            XCTAssertTrue(getMemoryUsage()! <= ceiling)
            let largeColumns: PTable = try PTable(["test_ints": PColumn(intsColumn),
                                                    "test_doubles": PColumn(doublesColumn)])
            XCTAssertTrue(getMemoryUsage()! <= initialMemoryUsage + dataMemorySize + memoryCushion)
            return largeColumns
        }()
        XCTAssertEqual(swiftTable.count!, Int(numRows))
        XCTAssertTrue(getMemoryUsage()! <= initialMemoryUsage + dataMemorySize + memoryCushion)
    }

    func testDoubleNans() throws {
        let doublesValues: [Double] = [1.22, 0.33, -11.2, Double.nan, Double.nan, 1.44]
        let doublesColumn = PColumn(doublesValues)
        let table = try PTable(["doublesWithNans": doublesColumn])
        let filePath = "./doublesWithNans.feather"
        try table.toFeather(filePath: filePath)

        let decodedColumns = try PTable(fromFeather: filePath)
        XCTAssertTrue(testArrayEquivalenceWithNan(array1: doublesValues,
                                                  array2: try decodedColumns["doublesWithNans"]!.asDType()))
        let testValues: [Double] = [1.0, 1.0, 1.0]
        let testColumn = PColumn(testValues)
        XCTAssertFalse(testArrayEquivalenceWithNan(array1: doublesValues, array2: try testColumn.asDType()))
    }

    // TODO: Add a test for nulls especially in Strings

    func testPenguinMemoryAlloctions() throws {
        let numRows = 5_000_000
        let initialMemoryUsage = getMemoryUsage()!
        let memoryCushion: UInt64 = 45_000_000
        let dataMemorySize: UInt64 = UInt64(numRows) * 1 * 8 // one column, 8 bytes per column
        let doublesValues: [Double] = (0..<numRows).map { Double.random(in: 0.0...Double($0)) }
        let doublesColumn: PColumn = PColumn(doublesValues)
        let ceiling = initialMemoryUsage + dataMemorySize + memoryCushion
        let floor = initialMemoryUsage + dataMemorySize - memoryCushion
        XCTAssertTrue(getMemoryUsage()! <= ceiling)
        XCTAssertTrue(getMemoryUsage()! >= floor)
        let table = try PTable(["doublesColumn": doublesColumn])
        XCTAssertTrue(getMemoryUsage()! <= ceiling)
        XCTAssertTrue(getMemoryUsage()! >= floor)
        XCTAssertEqual(table.count, numRows)
    }

    func testCSVReading() throws {
        let gTableFromCompressed = try readCSV(path: "./data/test_data.csv.gz")
        if let gTable = gTableFromCompressed {
            let pTable = try PTable(gTable)
            XCTAssertEqual(try pTable["test_double"]!.asDType()[0], Double(11064))
        } else {
            fatalError()
        }

        let gTableFromRaw = try readCSV(path: "./data/test_data.csv")
        if let gTable = gTableFromRaw {
            let pTable = try PTable(gTable)
            XCTAssertEqual(try pTable["test_double"]!.asDType()[0], Double(11064))
        } else {
            fatalError()
        }

        let gTableFromMultiple = try readCSVs(paths: ["./data/test_data.csv", "./data/test_data2.csv"])
        if let gTable = gTableFromMultiple {
            let pTable = try PTable(gTable)
            XCTAssertEqual(try pTable["test_double"]!.asDType()[0], Double(11064))
            XCTAssertEqual(try pTable["test_double"]!.asDType()[19], Double(-11.2))
        } else {
            fatalError()
        }
    }

    func testArrayToArrow() throws {
        let array: [Float] = (0..<10).map { _ in Float.random(in: 0.0...1.0) }
        /*let arrayOfArrays: [[Float]] = (0..<5).map { _ in*/
                                            /*(0..<10).map { _ in*/
                                                        /*Float.random(in: 0.0...1.0) }}*/
        try array.toFeather(filePath: "./data/array.feather")
        let arrayFromFeather = try [Float](fromFeather: "./data/array.feather")
        XCTAssertEqual(array, arrayFromFeather)
    }

    static var allTests = [
        ("testCreateAndSaveDoublesToFile", testCreateAndSaveDoublesToFile),
        ("testLoadDoublesFromFile", testLoadDoublesFromFile),
        ("testCreateAndSaveIntsToFile", testCreateAndSaveIntsToFile),
        ("testLoadIntsFromFile", testLoadIntsFromFile),
        ("testCreateAndSaveBoolsToFile", testCreateAndSaveBoolsToFile),
        ("testLoadBoolsFromFile", testLoadBoolsFromFile),
        ("testCreateAndSaveStringsToFile", testCreateAndSaveStringsToFile),
        ("testLoadStringFromFile", testLoadStringFromFile),
        ("testSwiftSingleTypeMatrixToFile", testSwiftSingleTypeMatrixToFile),
        ("testSwiftMultipleTypesMatrixToFile", testSwiftMultipleTypesMatrixToFile),
        ("testMultiChunkArrays", testMultiChunkArrays),
        ("testLargeColumns", testLargeColumns),
        ("testBasicMemoryUsage", testBasicMemoryUsage),
        ("testDoubleNans", testDoubleNans),
        ("testPenguinMemoryAlloctions", testPenguinMemoryAlloctions),
        ("testCSVReading", testCSVReading),
        ("testArrayToArrow", testArrayToArrow)
    ]
}
