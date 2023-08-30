import Foundation

@attached(extension, conformances: ApproximateEquality, names: named(isApproximatelyEqual(to:relativeTolerance:)))
public macro DeriveApproximateEquality() = #externalMacro(module: "ApproximateEqualityMacros", type: "DeriveApproximateEquality")

@attached(peer)
public macro ApproximateEqualityIgnored() = #externalMacro(module: "ApproximateEqualityMacros", type: "ApproximateEqualityIgnored")
