import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct DeriveApproximateEquality {
}

extension DeriveApproximateEquality: ExtensionMacro {
    public static func expansion(of node: AttributeSyntax, attachedTo declaration: some DeclGroupSyntax, providingExtensionsOf type: some TypeSyntaxProtocol, conformingTo protocols: [TypeSyntax], in context: some MacroExpansionContext) throws -> [ExtensionDeclSyntax] {
        let patternBindings = declaration.match(path: [
            MemberBlockSyntax.self,
            MemberBlockItemListSyntax.self,
            MemberBlockItemSyntax.self,
            VariableDeclSyntax.self,
        ], viewMode: .sourceAccurate)
        .map { $0.as(VariableDeclSyntax.self)! }
        .filter {
            guard !$0.attributes.isEmpty else {
                return true
            }
            return !$0.attributes.contains { element in
                return element.trimmedDescription == "@ApproximateEqualityIgnored"
            }
        }
        .map {
            $0.match(path: [
                PatternBindingListSyntax.self,
                PatternBindingSyntax.self,
            ], viewMode: .sourceAccurate).first!
        }
        .map {
            $0.as(PatternBindingSyntax.self)!
        }
        let tests = patternBindings.map { binding in
            let identifier = binding.pattern.as(IdentifierPatternSyntax.self)!.identifier
            let type = binding.typeAnnotation!.type.as(IdentifierTypeSyntax.self)!.name
            // TODO: Dislike the casting here.
            return "\(identifier).isApproximatelyEqual(to: other.\(identifier), absoluteTolerance: \(type)(absoluteTolerance))"
        }
        .joined(separator: "\n        && ")
        // TODO: Dislike the default type of Double.
        return [try ExtensionDeclSyntax(
            """
            extension \(type): ApproximateEquality {
                func isApproximatelyEqual(to other: Self, absoluteTolerance: Double.Magnitude) -> Bool {
                    \(raw: tests)
                }
            }
            """
        )]
    }
}

// MARK: -

public struct ApproximateEqualityIgnored {
}

extension ApproximateEqualityIgnored: PeerMacro {
    public static func expansion(of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        return []
    }
}
