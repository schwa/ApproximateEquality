// swift-tools-version: 5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "ApproximateEquality",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "ApproximateEquality",
            targets: ["ApproximateEquality"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"),
    ],
    targets: [
        .target(
            name: "ApproximateEquality",
            dependencies: [
                "ApproximateEqualityMacros",
                .product(name: "Numerics", package: "swift-numerics")
            ]
        ),
        .macro(
            name: "ApproximateEqualityMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "ApproximateEqualityMacroTests",
            dependencies: [
                "ApproximateEquality",
                "ApproximateEqualityMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "ApproximateEqualityTests",
            dependencies: [
                "ApproximateEquality",
                .product(name: "Numerics", package: "swift-numerics")
            ]
        ),
    ]
)
