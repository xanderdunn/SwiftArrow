// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SwiftArrow",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        .library(name: "CMemoryHelper", targets: ["CMemoryHelper"]),
        .library(name: "SwiftArrow", targets: ["SwiftArrow"])
    ],
    dependencies: [
        .package(name: "SwiftyTextTable",
                 url: "https://github.com/scottrhoyt/SwiftyTextTable.git",
                 from: "0.5.0"),
        .package(name: "Penguin", // Google Brain's Swift version of pandas
                 url: "https://github.com/saeta/penguin.git",
                 .branch("main"))
    ],
    targets: [
        .target(name: "CMemoryHelper", path: "./Sources/CMemoryHelper"),
        .systemLibrary(name: "CArrow", pkgConfig: "arrow-glib",
            providers: [
                .brew(["apache-arrow-glib"]),
                .apt(["libarrow-glib-dev"])
            ]),
        .target(name: "SwiftArrow", dependencies: ["CArrow",
                                                   "SwiftyTextTable",
                                                   "CMemoryHelper",
                                                   .product(name: "PenguinTables", package: "Penguin")
                                                  ]),
        .testTarget(name: "ArrowTests", dependencies: ["SwiftArrow"])
    ]
)
