// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Arrow",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Arrow", targets: ["Arrow"])
    ],
    dependencies: [
        .package(name: "SwiftyTextTable",
                 url: "https://github.com/scottrhoyt/SwiftyTextTable.git",
                 from: "0.5.0")
    ],
    targets: [
        .systemLibrary(name: "CArrow", pkgConfig: "arrow-glib",
            providers: [
                .brew(["apache-arrow-glib"]),
                .apt(["libarrow-glib-dev"])
            ]),
        .target(name: "Arrow", dependencies: ["CArrow", "SwiftyTextTable"]),
        .testTarget(name: "ArrowTests", dependencies: ["Arrow"])
    ]
)
