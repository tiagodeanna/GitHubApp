import Foundation

struct Repository: Codable {
    let id: Int?
    let name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let itemDescription: String?
    let fork: Bool?
    let size, stargazersCount: Int?
    let language, visibility: String?
    let forks, openIssues, watchers: Int?
    let defaultBranch: String?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case itemDescription = "description"
        case fork, size
        case stargazersCount = "stargazers_count"
        case language, visibility, forks
        case openIssues = "open_issues"
        case watchers
        case defaultBranch = "default_branch"
        case score
    }
}
