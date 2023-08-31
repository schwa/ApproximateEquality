import XCTest
@testable import ApproximateEquality
import Numerics

extension Double {
    static let error = Double.Magnitude.ulpOfOne.squareRoot() / 2
}

final class NumericsTests: XCTestCase {
    func testFoundation() throws {
        XCTAssertTrue(Double.error < Double.Magnitude.ulpOfOne.squareRoot())
        XCTAssertTrue(Double.zero.isApproximatelyEqual(to: Double.zero)) // true (obviously)
        XCTAssertTrue((10.0).isApproximatelyEqual(to: 10.0 + .error)) // true (again, obviously)
        XCTAssertTrue(Double.zero.isApproximatelyEqual(to: Double.zero + .error)) // false (not so obvious)
    }
}

final class ApproximateEqualityTests: XCTestCase {
    func testExample() throws {
    }
}
