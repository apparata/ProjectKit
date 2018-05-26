// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ProjectKit",
    products: [
        .library(
            name: "ProjectKit",
            targets: ["ProjectKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ProjectKit",
            dependencies: []),
        .testTarget(
            name: "ProjectKitTests",
            dependencies: ["ProjectKit"]),
    ]
)
