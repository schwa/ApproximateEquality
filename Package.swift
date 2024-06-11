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
        .library(name: "ApproximateEquality", targets: ["ApproximateEquality"]),
        .library(name: "ApproximateEqualityMacros", targets: ["ApproximateEqualityMacros"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .target(name: "ApproximateEquality",
            dependencies: [
                "NumericsLite"
            ]
        ),
        .target(name: "ApproximateEqualityMacros",
            dependencies: [
                "ApproximateEquality",
                "ApproximateEqualityMacroImplementation"
            ]
        ),
        .macro(name: "ApproximateEqualityMacroImplementation",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "ApproximateEqualityMacroTests",
            dependencies: [
                "ApproximateEquality",
                "ApproximateEqualityMacroImplementation",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "ApproximateEqualityTests",
            dependencies: [
                "ApproximateEquality",
                "NumericsLite",
            ]
        ),
        .target(name: "NumericsLite"),
    ]
)
