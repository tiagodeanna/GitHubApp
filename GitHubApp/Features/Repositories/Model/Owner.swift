import Foundation

struct Owner: Codable {
    let login: String?
    let id: Int?
    let avatarURL, htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
    }
}
