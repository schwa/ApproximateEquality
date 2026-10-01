import NumericsLite
import simd

extension SIMD2: ApproximateEquality where Scalar: BinaryFloatingPoint, Scalar: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Scalar) -> Bool {
        isTupleApproximatelyEqual((x, y), (other.x, other.y), absoluteTolerance: absoluteTolerance)
    }
}

extension SIMD3: ApproximateEquality where Scalar: BinaryFloatingPoint, Scalar: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Scalar) -> Bool {
        isTupleApproximatelyEqual((x, y, z), (other.x, other.y, other.z), absoluteTolerance: absoluteTolerance)
    }
}

extension SIMD4: ApproximateEquality where Scalar: BinaryFloatingPoint, Scalar: ApproximateEquality {
    @inlinable
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Scalar) -> Bool {
        isTupleApproximatelyEqual((x, y, z, w), (other.x, other.y, other.z, other.w), absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_quatf {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        return self.vector.isApproximatelyEqual(to: other.vector, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_quatd {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        return self.vector.isApproximatelyEqual(to: other.vector, absoluteTolerance: absoluteTolerance)
    }
}

// MARK: -

public extension simd_float2x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float2x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float2x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float3x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float3x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float3x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float4x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float4x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_float4x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Float) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double2x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double2x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double2x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double3x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double3x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double3x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double4x2 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double4x3 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}

public extension simd_double4x4 {
    @inlinable
    func isApproximatelyEqual(to other: Self, absoluteTolerance: Double) -> Bool {
        isTupleApproximatelyEqual(self.columns, other.columns, absoluteTolerance: absoluteTolerance)
    }
}
