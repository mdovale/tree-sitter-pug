// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TreeSitterPug",
    products: [
        .library(name: "TreeSitterPug", targets: ["TreeSitterPug"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterPug",
            dependencies: [],
            path: ".",
            exclude: [
                "binding.gyp",
                "bindings/node",
                "bindings/rust",
                "Cargo.toml",
                "Cargo.lock",
                "LICENSE",
                "grammar.js",
                "package.json",
                "yarn.lock",
                "README.md",
                "src/grammar.json",
                "src/node-types.json",
                "test",
            ],
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")],
        ),
        .testTarget(
            name: "TreeSitterPugTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterPug",
            ],
            path: "bindings/swift/TreeSitterPugTests",
        ),
    ],
    cLanguageStandard: .c11,
)
