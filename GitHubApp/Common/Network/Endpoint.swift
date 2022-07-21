import Foundation

enum Endpoint {
    case repositories
    
    var url: URL {
        switch self {
        case .repositories:
            return URL(string:  "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!
        }
    }
}
