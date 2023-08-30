@_implementationOnly import Numerics

public protocol ApproximateEquality {
    associatedtype Magnitude: FloatingPoint

    func isApproximatelyEqual(to other: Self, relativeTolerance: Magnitude) -> Bool
    func isApproximatelyEqual(to other: Self) -> Bool
}

extension ApproximateEquality where Self: Numeric {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, relativeTolerance: relativeTolerance, norm: \.magnitude)
    }
    public func isApproximatelyEqual(to other: Self) -> Bool {
        return isApproximatelyEqual(to: other, relativeTolerance: Magnitude.ulpOfOne.squareRoot(), norm: \.magnitude)
    }
}

extension ApproximateEquality where Self.Magnitude: FloatingPoint {
    public func isApproximatelyEqual(to other: Self) -> Bool {
        return isApproximatelyEqual(to: other, relativeTolerance: Magnitude.ulpOfOne.squareRoot())
    }
}

extension Float: ApproximateEquality {
}

extension Double: ApproximateEquality {
}

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
