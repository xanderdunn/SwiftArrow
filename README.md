### Installation
- On Ubuntu 18.04, install Apache Arrow GLib, instructions from [here](https://arrow.apache.org/install/):
    - `sudo apt update`
    - `sudo apt install -y -V ca-certificates lsb-release wget`
    - `wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb`
    - `sudo apt update`
    - `sudo apt install -y -V libarrow-glib-dev`
- On macOS:
    - `brew install apache-arrow-glib`
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
```swift
let array: [Float] = (0..<10).map { _ in Float.random(in: 0.0...1.0) }
try array.toFeather(filePath: "./data/array.feather")
let arrayFromFeather = try [Float](fromFeather: "./data/array.feather")
```

#### PenguinTables to/from .feather:
```swift
```
