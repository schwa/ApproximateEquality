@_implementationOnly import Numerics

/// Types conforming to ``ApproximateEquality`` can be tested for approximate equality with ``isApproximatelyEqual(to:relativeTolerance:)-6v7ke``
public protocol ApproximateEquality {
    associatedtype Magnitude: FloatingPoint

    // TODO: Provide version that uses ``norm`` from ``Numerics.isApproximatelyEqual``
    func isApproximatelyEqual(to other: Self, relativeTolerance: Magnitude) -> Bool
    func isApproximatelyEqual(to other: Self) -> Bool
}

extension ApproximateEquality where Self.Magnitude: FloatingPoint {
    public func isApproximatelyEqual(to other: Self) -> Bool {
        return isApproximatelyEqual(to: other, relativeTolerance: Magnitude.ulpOfOne.squareRoot())
    }
}

extension ApproximateEquality where Self: Numeric {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, relativeTolerance: relativeTolerance, norm: \.magnitude)
    }
}

extension Float: ApproximateEquality {
}

extension Double: ApproximateEquality {
}

/// Test elements of `self` against elements `other` for approximate equality.
/// Arrays of differing counts are considered no approximately equal.
extension Array: ApproximateEquality where Element: ApproximateEquality {
    public typealias Magnitude = Element.Magnitude

    public func isApproximatelyEqual(to other: Self, relativeTolerance: Element.Magnitude) -> Bool {
        guard self.count == other.count else {
            return false
        }
        return zip(self, other).allSatisfy({
            return $0.isApproximatelyEqual(to: $1, relativeTolerance: relativeTolerance)
        })
    }
}
