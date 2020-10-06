// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SwiftArrow",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        .library(name: "SwiftArrow", targets: ["SwiftArrow"])
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
        .target(name: "SwiftArrow", dependencies: ["CArrow", "SwiftyTextTable"]),
        .testTarget(name: "ArrowTests", dependencies: ["SwiftArrow"])
    ]
)
