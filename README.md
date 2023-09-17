# ApproximateEquality

## ``ApproximateEquality`` protocol

For numeric types this uses ``isApproximatelyEqual`` from [Swift Numerics](https://www.swift.org/blog/numerics/).

## ``DeriveApproximateEquality`` macro.

Annotate your types with ``DeriveApproximateEquality`` to automatically conform to ``ApproximateEquality`` and derive an implementation.

### ``DeriveApproximateEquality`` Example

```swift
import ApproximateEquality
import ApproximateEqualityMacros
import CoreGraphics

@DeriveApproximateEquality
public struct MyType {
    var x: Double
    var y: CGPoint
    @ApproximateEqualityIgnored
    var z: Double
    var w: Float
}

let thing1 = MyType(x: 10, y: CGPoint(x: 20, y: 0), z: 30, w: 0)
let thing2 = MyType(x: 10, y: CGPoint(x: 20, y: 0), z: 40, w: 0)
let error = 0.000_001
let thing3 = MyType(x: 10 + error, y: CGPoint(x: 20, y: 0), z: 40, w: 0)

print(thing1.isApproximatelyEqual(to: thing2, absoluteTolerance: 0.0001))      // true
print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.0001))      // true
print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.000_000_1)) // false
```

Expanding the ``@DeriveApproximateEquality`` macro generates an extension:

```swift
extension MyType: ApproximateEquality {
    public func isApproximatelyEqual(to other: Self, absoluteTolerance: Double.Magnitude) -> Bool {
        x.isApproximatelyEqual(to: other.x, absoluteTolerance: Double.Magnitude(absoluteTolerance))
        && y.isApproximatelyEqual(to: other.y, absoluteTolerance: CGPoint.Magnitude(absoluteTolerance))
        && w.isApproximatelyEqual(to: other.w, absoluteTolerance: Float.Magnitude(absoluteTolerance))
    }
}
```

Note that the property prefixed with ``@ApproximateEqualityIgnored`` is used in the implementation.

## TODO

- [ ]: Test against more complex types.
- [X]: Pass through absolute tolerance, norm etc.
- [X]: Handle the casting to `Double` in ``DeriveApproximateEquality``
