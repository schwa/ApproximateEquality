import CoreGraphics

extension CGFloat: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
    }
}

extension CGPoint: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        isTupleApproximatelyEqual((x, y), (other.x, other.y), absoluteTolerance: absoluteTolerance)
    }
}

extension CGSize: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        isTupleApproximatelyEqual((width, height), (other.width, other.height), absoluteTolerance: absoluteTolerance)
    }
}

extension CGVector: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        isTupleApproximatelyEqual((dx, dy), (other.dx, other.dy), absoluteTolerance: absoluteTolerance)
    }
}

extension CGRect: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        isTupleApproximatelyEqual((minX, minY, width, height), (other.minX, other.minY, other.width, other.height), absoluteTolerance: absoluteTolerance)

    }
}
