import Foundation

/// Automatically add conformance to ``ApproximateEquality`` to a type and provide an implementation of ``isApproximatelyEqual``
///
/// ```swift
/// @DeriveApproximateEquality
/// struct MyType {
///     var x: Double
///     var y: Double
///     @ApproximateEqualityIgnored
///     var z: Double
/// }
/// ```
@attached(extension, conformances: ApproximateEquality, names: named(isApproximatelyEqual(to:relativeTolerance:)))
public macro DeriveApproximateEquality() = #externalMacro(module: "ApproximateEqualityMacros", type: "DeriveApproximateEquality")

/// Use on a property to opt out of ``DeriveApproximateEquality``. Use this for when you don't want a property to be considered for ``ApproximateEquality`` conformance.
///
/// ```swift
/// @DeriveApproximateEquality
/// struct MyType {
///     var x: Double
///     var y: Double
///     @ApproximateEqualityIgnored
///     var z: Double
/// }
/// ```
@attached(peer)
public macro ApproximateEqualityIgnored() = #externalMacro(module: "ApproximateEqualityMacros", type: "ApproximateEqualityIgnored")
