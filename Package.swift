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
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "ApproximateEquality",
            dependencies: [
                "NumericsLite"
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
