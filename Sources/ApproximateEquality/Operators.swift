infix operator ≅: ComparisonPrecedence
infix operator !≅: ComparisonPrecedence

public extension ApproximateEquality {
    static func ≅(lhs: Self, rhs: Self) -> Bool {
        return lhs.isApproximatelyEqual(to: rhs)
    }

    static func !≅(lhs: Self, rhs: Self) -> Bool {
        return !lhs.isApproximatelyEqual(to: rhs)
    }
}
