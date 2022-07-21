import Foundation

struct Owner: Codable {
    let login: String?
    let id: Int?
    let avatarURL, url: String?

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case url
    }
}
