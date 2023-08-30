import ApproximateEquality

@DeriveApproximateEquality
struct MyType {
    var x: Double
    var y: Double
    @ApproximateEqualityIgnored
    var z: Double
}

let thing1 = MyType(x: 10, y: 20, z: 30)
let thing2 = MyType(x: 10, y: 20, z: 40)
let error = 0.000_001
let thing3 = MyType(x: 10 + error, y: 20, z: 40)

print(thing1.isApproximatelyEqual(to: thing2))
print(thing1 ≅ thing2)
print(!thing1.isApproximatelyEqual(to: thing3))
print(thing1 !≅ thing3)
print(thing1.isApproximatelyEqual(to: thing3, relativeTolerance: 0.1))
