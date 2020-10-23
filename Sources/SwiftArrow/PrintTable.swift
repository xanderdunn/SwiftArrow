import Foundation

import SwiftyTextTable

/**
Transpose an array of ararys from rows to columns or from columns to rows
From https://stackoverflow.com/a/39891965/529743
*/
public extension Collection where Self.Iterator.Element: RandomAccessCollection {
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map { $0[index] }
        }
    }
}

// TODO: Only print the first n rows
public func printTable(rows: [[CustomStringConvertible]], columnNames: [String]) {
    let textTableColumns: [TextTableColumn] = columnNames.map { TextTableColumn(header: $0) }
    var textTable = TextTable(columns: textTableColumns)
    for rowVector in rows {
        textTable.addRow(values: rowVector)
    }
    let tableString = textTable.render()
    print(tableString)
}

// TODO: This is very inefficient. Should simply be able to create a SwiftyTextTable with columnar values rather than
//  adding by row
public func printTable(columns: [[CustomStringConvertible]], columnNames: [String]) {
    printTable(rows: columns.transposed(), columnNames: columnNames)
}

// Pretty printing the table
/*extension ArrowColumns {*/
    /*public func printTable() {*/
        /*let textTableColumns: [TextTableColumn] = self.columns.map { TextTableColumn(header: $0) }*/
        /*var textTable = TextTable(columns: textTableColumns)*/
        /*for rowVector in rows {*/
            /*textTable.addRow(values: rowVector)*/
        /*}*/
        /*let tableString = textTable.render()*/
        /*print(tableString)*/
    /*}*/
/*}*/
