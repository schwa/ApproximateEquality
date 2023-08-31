import CoreGraphics

extension CGFloat: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Magnitude) -> Bool {
        return isApproximatelyEqual(to: other, absoluteTolerance: absoluteTolerance, relativeTolerance: Magnitude.zero)
    }
}

extension CGPoint: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        [x, y].isApproximatelyEqual(to: [other.x, other.y], absoluteTolerance: absoluteTolerance)
    }
}

extension CGSize: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        [width, height].isApproximatelyEqual(to: [other.width, other.height], absoluteTolerance: absoluteTolerance)
    }
}

extension CGVector: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        [dx, dy].isApproximatelyEqual(to: [other.dx, other.dy], absoluteTolerance: absoluteTolerance)
    }
}

extension CGRect: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: CGFloat.Magnitude) -> Bool {
        [minX, minY, width, height].isApproximatelyEqual(to: [other.minX, other.minY, other.width, other.height], absoluteTolerance: absoluteTolerance)
    }
}
