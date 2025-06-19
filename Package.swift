// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ScanCodes",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .macOS(.v12),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ScanCodes",
            targets: ["ScanCodes"]
        )
    ],
    targets: [
        .target(
            name: "ScanCodes"
        ),
        .testTarget(
            name: "ScanCodesTests",
            dependencies: ["ScanCodes"]
        )
    ]
)
