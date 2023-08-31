import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(ApproximateEqualityMacros)
import ApproximateEqualityMacros

let testMacros: [String: Macro.Type] = [
    "DeriveApproximateEquality": DeriveApproximateEquality.self,
    "ApproximateEqualityIgnored": ApproximateEqualityIgnored.self,
]
#endif

final class MyMacroTests: XCTestCase {
    func testApproximateEqualityMacros() throws {
#if canImport(ApproximateEqualityMacros)
        assertMacroExpansion(
            """
            @DeriveApproximateEquality
            struct HelloWorld: Foobar {
                var attribute1: Double
                var attribute2: Double
            }
            """,
            expandedSource: """
            struct HelloWorld: Foobar {
                var attribute1: Double
                var attribute2: Double
            }

            extension HelloWorld: ApproximateEquality {
                func isApproximatelyEqual(to other: Self, absoluteTolerance: Double.Magnitude) -> Bool {
                    attribute1.isApproximatelyEqual(to: other.attribute1, absoluteTolerance: Double(absoluteTolerance))
                    && attribute2.isApproximatelyEqual(to: other.attribute2, absoluteTolerance: Double(absoluteTolerance))
                }
            }
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func testApproximateEqualityIgnoredMacros() throws {
        #if canImport(ApproximateEqualityMacros)
        assertMacroExpansion(
            """
            @DeriveApproximateEquality
            struct HelloWorld: Foobar {
                var attribute1: Double
                @ApproximateEqualityIgnored
                var attribute2: Double
            }
            """,
            expandedSource: """
            struct HelloWorld: Foobar {
                var attribute1: Double
                var attribute2: Double
            }

            extension HelloWorld: ApproximateEquality {
                func isApproximatelyEqual(to other: Self, absoluteTolerance: Double.Magnitude) -> Bool {
                    attribute1.isApproximatelyEqual(to: other.attribute1, absoluteTolerance: Double(absoluteTolerance))
                }
            }
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
