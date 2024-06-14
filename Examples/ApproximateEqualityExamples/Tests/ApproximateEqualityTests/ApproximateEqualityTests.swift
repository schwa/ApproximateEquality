import XCTest
@testable import ApproximateEquality
@testable import ApproximateEqualityMacros
import Numerics

@DeriveApproximateEquality
public struct MyType {
    var x: Double
    var y: CGPoint
    @ApproximateEqualityIgnored
    var z: Double
    var w: Float
}

final class ApproximateEqualityTests: XCTestCase {
    func testExample() throws {
        let thing1 = MyType(x: 10, y: CGPoint(x: 20, y: 0), z: 30, w: 0)
        let thing2 = MyType(x: 10, y: CGPoint(x: 20, y: 0), z: 40, w: 0)
        let error = 0.000_001
        let thing3 = MyType(x: 10 + error, y: CGPoint(x: 20, y: 0), z: 40, w: 0)

        print(thing1.isApproximatelyEqual(to: thing2, absoluteTolerance: 0.0001))      // true
        print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.0001))      // true
        print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.000_000_1)) // false

    }
}
