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
    targets: [
        .systemLibrary(name: "CArrow", pkgConfig: "arrow-glib",
            providers: [
                .brew(["apache-arrow-glib"]),
                .apt(["libarrow-glib-dev"])
            ]),
        .target(name: "Arrow", dependencies: ["CArrow"]),
        .testTarget(name: "ArrowTests", dependencies: ["Arrow"])
    ]
)
