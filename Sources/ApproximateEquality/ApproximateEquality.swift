import Numerics

/// Types conforming to ``ApproximateEquality`` can be tested for approximate equality with ``isApproximatelyEqual(to:absoluteTolerance:)-6v7ke``
public protocol ApproximateEquality {
    associatedtype Magnitude: FloatingPoint

    func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool
}

//extension ApproximateEquality where Self.Magnitude: FloatingPoint {
//    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
//        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
//    }
//}

extension Float: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
    }
}

extension Double: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
    }
}

/// Test elements of `self` against elements `other` for approximate equality.
/// Arrays of differing counts are considered no approximately equal.
extension Array: ApproximateEquality where Element: ApproximateEquality {
    public typealias Magnitude = Element.Magnitude

    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Element.Magnitude) -> Bool {
        guard self.count == other.count else {
            return false
        }
        return zip(self, other).allSatisfy({
            return $0.isApproximatelyEqual(to: $1, absoluteTolerance: absoluteTolerance)
        })
    }
}

internal func isApproximatelyEqualX <T>(_ lhs: T, _ rhs: T, absoluteTolerance: T.Magnitude) -> Bool where T: ApproximateEquality {
    lhs.isApproximatelyEqual(to: rhs, absoluteTolerance: absoluteTolerance)
}

@inlinable
public func isTupleApproximatelyEqual <T>(_ lhs: (T, T), _ rhs: (T, T), absoluteTolerance: T.Magnitude) -> Bool where T: ApproximateEquality {
    lhs.0.isApproximatelyEqual(to: rhs.0, absoluteTolerance: absoluteTolerance)
    && lhs.1.isApproximatelyEqual(to: rhs.1, absoluteTolerance: absoluteTolerance)
}

@inlinable
public func isTupleApproximatelyEqual <T>(_ lhs: (T, T, T), _ rhs: (T, T, T), absoluteTolerance: T.Magnitude) -> Bool where T: ApproximateEquality {
    lhs.0.isApproximatelyEqual(to: rhs.0, absoluteTolerance: absoluteTolerance)
    && lhs.1.isApproximatelyEqual(to: rhs.1, absoluteTolerance: absoluteTolerance)
    && lhs.2.isApproximatelyEqual(to: rhs.2, absoluteTolerance: absoluteTolerance)
}

@inlinable
public func isTupleApproximatelyEqual <T>(_ lhs: (T, T, T, T), _ rhs: (T, T, T, T), absoluteTolerance: T.Magnitude) -> Bool where T: ApproximateEquality {
    lhs.0.isApproximatelyEqual(to: rhs.0, absoluteTolerance: absoluteTolerance)
    && lhs.1.isApproximatelyEqual(to: rhs.1, absoluteTolerance: absoluteTolerance)
    && lhs.2.isApproximatelyEqual(to: rhs.2, absoluteTolerance: absoluteTolerance)
    && lhs.3.isApproximatelyEqual(to: rhs.3, absoluteTolerance: absoluteTolerance)
}
