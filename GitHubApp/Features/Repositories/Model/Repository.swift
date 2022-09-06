import Foundation

struct Repository: Codable {
    let id: Int?
    let name, fullName: String?
    let owner: Owner?
    let htmlURL: String?
    let description: String?
    let createdAt, updatedAt, pushedAt: String?
    let stargazersCount, watchersCount: Int?
    let language: String?
    let forksCount, openIssuesCount, forks, openIssues: Int?
    let watchers: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
        case forks
        case openIssues = "open_issues"
        case watchers
    }
}
