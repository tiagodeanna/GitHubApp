import Foundation

struct Repositories: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Repository]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
