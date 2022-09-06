import Foundation

enum Endpoint {
    case repositories(query: String, page: Int)
    
    var url: URL {
        switch self {
        case let .repositories(query, page):
            return URL(string: "\(Environment.baseURL)/search/repositories?q=language:\(query)&sort=stars&page=\(page)")!
        }
    }
}
