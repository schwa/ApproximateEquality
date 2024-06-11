import XCTest
@testable import ApproximateEquality

extension Double {
    static let error = 0.00001
}

//final class NumericsTests: XCTestCase {
//    func testFoundation() throws {
//        XCTAssertTrue(Double.error < Double.Magnitude.ulpOfOne.squareRoot())
//        XCTAssertTrue(Double.zero.isApproximatelyEqual(to: Double.zero)) // true (obviously)
//        XCTAssertTrue((10.0).isApproximatelyEqual(to: 10.0 + .error)) // true (again, obviously)
//        XCTAssertTrue(Double.zero.isApproximatelyEqual(to: Double.zero + .error)) // false (not so obvious)
//    }
//}

final class ApproximateEqualityTests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(CGPoint(x: 0, y: 0).isApproximatelyEqual(to: CGPoint(x: 0.05, y: 0), absoluteTolerance: 0.1))
        XCTAssertFalse(CGPoint(x: 0, y: 0).isApproximatelyEqual(to: CGPoint(x: 0.15, y: 0), absoluteTolerance: 0.1))
    }
}
