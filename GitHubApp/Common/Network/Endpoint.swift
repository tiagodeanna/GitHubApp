import Foundation

enum Endpoint {
    case repositories(query: String, page: Int)
    case pulls(ownerName: String, repoName: String)
    
    var url: URL {
        switch self {
        case let .repositories(query, page):
            return URL(withString: "\(Environment.baseURL)/search/repositories?q=language:\(query)&sort=stars&page=\(page)")
            
        case let .pulls(ownerName, repoName):
            return URL(withString: "\(Environment.baseURL)/repos/\(ownerName)/\(repoName)/pulls?state=all")
        }
    }
}
