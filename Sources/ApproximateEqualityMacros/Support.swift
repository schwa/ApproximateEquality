import SwiftSyntax

enum Match {
    case any
    case test((SyntaxProtocol) -> Bool)
    case type(SyntaxProtocol.Type)
//    case nonConsuming(Match2)
}

extension Match {
    func match(_ node: SyntaxProtocol) -> Bool {
        switch self {
        case .any:
            true
        case .test(let function):
            function(node)
        case .type(let type):
            node.syntaxNodeType == type
        }
    }
}

extension SyntaxProtocol {
    func match(path: [Match], viewMode: SyntaxTreeViewMode) -> [SyntaxProtocol] {
        // TODO: Match self.
        guard let matcher = path.first else {
            return []
        }
        var result: [SyntaxProtocol] = []
        for child in self.children(viewMode: viewMode) {
            if matcher.match(child) {
                result.append(child)
            }
        }
        if path.count == 1 {
            return result
        }
        else {
            let path = Array(path.dropFirst())
            return result.flatMap { $0.match(path: path, viewMode: viewMode) }
        }
    }

    func match(path: [SyntaxProtocol.Type], viewMode: SyntaxTreeViewMode) -> [SyntaxProtocol] {
        return match(path: path.map { .type($0) }, viewMode: viewMode)
    }
}

extension SyntaxProtocol {
    func find() -> [Any] {
        return []
    }
}
