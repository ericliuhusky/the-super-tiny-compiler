// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "the-super-tiny-compiler",
    products: [
        .executable(
            name: "the-super-tiny-compiler",
            targets: ["the-super-tiny-compiler"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "the-super-tiny-compiler",
            dependencies: []),
    ]
)
