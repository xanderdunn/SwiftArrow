### Installation
- Required apache-arrow-glib 3.0.0+
- On Ubuntu 18.04, install Apache Arrow GLib, instructions from [here](https://arrow.apache.org/install/):
    - `sudo apt update`
    - `sudo apt install -y -V ca-certificates lsb-release wget`
    -apache-arrow-glib `wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt update`
    - `sudo apt install -y -V libarrow-glib-dev`
    - To see which version is installed: `sudo apt list libarrow-glib-dev`
- On macOS:
    - `brew install apache-arrow-glib`
    - To see which version is installed: `brew list --versions apache-arrow-glib`
- Generate and build the Swift files:
    - `swift build`
- Test:
    - `swift test`

### Development
- The pkg-config file is at `/usr/lib/x86_64-linux-gnu/pkgconfig/arrow.pc`
- `pkg-config --cflags arrow-glib`
- Apache Arrow GLib interface documentation [here](https://arrow.apache.org/docs/c_glib/arrow-glib/)
- Apache Arrow GLib example code [here](https://github.com/apache/arrow/tree/master/c_glib/example)
- Note that the tests pass on Swift 5.3-RELEASE but do not build on Swift for Tensorflow 0.10. The library itself does successfully build on Swift for Tensorflow 0.10

### Usage

#### Swift Arrays to/from .feather:
- Data types supported for array saving to and from .feather: `Date`, `String`, `Double`, `Float`, `Int`, `Int64`, and `Bool`.
```swift
let array: [Float] = (0..<10).map { _ in Float.random(in: 0.0...1.0) }
try array.toFeather(filePath: "./data/array.feather")
let arrayFromFeather = try [Float](fromFeather: "./data/array.feather")
```

#### PenguinTables to/from .feather:
- Data types supported as values inside `PTable`s: `Double`, `String`, `Int64`, `Bool`
```swift
let row1: [Any] = ["e12fe9879b95b35479a1195bd2190b10", 2137.8 as Double, false]
let row2: [Any] = ["02528b1bca6c637a9d725488efa1de80", 2137.4 as Double, true]
let row3: [Any] = ["1de820d72a41bf02fdc55a8991797991", 879.5 as Double, true]
let rows = [row1, row2, row3]
let columnNames = ["id", "ask", "prohibited"]
let columns = rows.transposed()
let table = try PTable([columnNames[0]: PColumn(columns[0] as! [String]),
                        columnNames[1]: PColumn(columns[1] as! [Double]),
                        columnNames[2]: PColumn(columns[2] as! [Bool])])
assert(table.columnNames == columnNames.sorted())
let filePath = "tableMultiple.feather"
try table.toFeather(filePath: filePath)

let columnsDecoded = try PTable(fromFeather: filePath)
let doubleColumnDecoded: PTypedColumn<Double> = try columnsDecoded[columnNames[1]]!.asDType()
assert(doubleColumnDecoded[2] ==  879.5)
assert(columnsDecoded.columnNames == columnNames.sorted())
```

Further data types can be supported, the code just needs to be extended for them.
