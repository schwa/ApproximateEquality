import XCTest
@testable import ApproximateEquality

final class ApproximateEqualityTests: XCTestCase {
    func testExample() throws {

        let below = Double.Magnitude.ulpOfOne.squareRoot() / 2

        XCTAssertTrue(10.0 ≅ 10.0 + below)
        XCTAssertFalse(10.0 ≅ 10.0 + 0.001)

        XCTAssertTrue(CGPoint(x: 10, y: 10) ≅ CGPoint(x: 10 + below, y: 10))

    }
}
