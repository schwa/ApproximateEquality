// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ApproximateEqualityExamples",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(path: "../..")
    ],
    targets: [
        .executableTarget(
            name: "ApproximateEqualityExamples",
            dependencies: [
                .product(name: "ApproximateEquality", package: "ApproximateEquality"),
                .product(name: "ApproximateEqualityMacros", package: "ApproximateEquality"),
            ]
        ),
    ]
)
