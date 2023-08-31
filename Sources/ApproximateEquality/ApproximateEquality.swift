@_implementationOnly import Numerics

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
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
    }
}

extension Double: ApproximateEquality {
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

//internal func isApproximatelyEqualX <T>(_ lhs: T, _ rhs: T, absoluteTolerance: T.Magnitude) -> Bool where T: ApproximateEquality {
//    return lhs.isApproximatelyEqual(to: rhs, absoluteTolerance: absoluteTolerance)
//}
//
//func isApproximatelyEqual <each T, each M> (_ lhs: (repeat each T), _ rhs: (repeat each T), absoluteTolerance: repeat each M) -> Bool where repeat each T: ApproximateEquality, repeat each M == (repeat (each T.Magnitude)) {
////    let x = (repeat isApproximatelyEqualX(each lhs, each rhs, absoluteTolerance: each T.Magnitude(absoluteTolerance)))
//    fatalError()
//}
