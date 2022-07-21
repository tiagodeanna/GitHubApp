import Foundation

struct Repositories: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let repositories: [Repository]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }
}
