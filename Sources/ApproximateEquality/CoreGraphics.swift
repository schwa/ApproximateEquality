import CoreGraphics

extension CGFloat: ApproximateEquality {
}

extension CGPoint: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: CGFloat.Magnitude) -> Bool {
        [x, y].isApproximatelyEqual(to: [other.x, other.y], relativeTolerance: relativeTolerance)
    }
}

extension CGSize: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: CGFloat.Magnitude) -> Bool {
        [width, height].isApproximatelyEqual(to: [other.width, other.height], relativeTolerance: relativeTolerance)
    }
}

extension CGVector: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: CGFloat.Magnitude) -> Bool {
        [dx, dy].isApproximatelyEqual(to: [other.dx, other.dy], relativeTolerance: relativeTolerance)
    }
}

extension CGRect: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, relativeTolerance: CGFloat.Magnitude) -> Bool {
        [minX, minY, width, height].isApproximatelyEqual(to: [other.minX, other.minY, other.width, other.height], relativeTolerance: relativeTolerance)
    }
}
