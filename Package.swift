// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Arrow",
    products: [ .library(name: "Arrow", targets: ["Arrow"]) ],
    dependencies: [
        .package(name: "GLibObject", url: "https://github.com/rhx/SwiftGObject.git", .branch("master"))
    ],
    targets: [
        .systemLibrary(name: "CArrow", pkgConfig: "arrow-glib glib-2.0 gio-unix-2.0",
            providers: [
                .apt(["libarrow-glib-dev", "libglib2.0-dev", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(name: "Arrow", dependencies: ["CArrow", "GLibObject"]),
        /*.testTarget(name: "GLibTests", dependencies: ["GLib"]),*/
    ]
)
