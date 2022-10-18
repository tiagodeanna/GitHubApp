import Foundation

extension URL {
    init(withString string: String) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }
        self = url
    }
}
