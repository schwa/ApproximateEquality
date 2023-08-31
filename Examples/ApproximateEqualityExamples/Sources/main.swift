import ApproximateEquality

@DeriveApproximateEquality
struct MyType: Equatable {
    var x: Double
    var y: Double
    @ApproximateEqualityIgnored
    var z: Double
}

let thing1 = MyType(x: 10, y: 20, z: 30)
let thing2 = MyType(x: 10, y: 20, z: 40)
let error = 0.000_001
let thing3 = MyType(x: 10 + error, y: 20, z: 40)

print(thing1.isApproximatelyEqual(to: thing2, absoluteTolerance: 0.0001))      // true
print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.0001))      // true
print(thing1.isApproximatelyEqual(to: thing3, absoluteTolerance: 0.000_000_1)) // false
