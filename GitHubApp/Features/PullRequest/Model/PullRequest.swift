import Foundation

struct PullRequest: Codable {
    let url, htmlURL: String?
    let title, body, state: String?
    let head: Head?
    
    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case url
        case title
        case body
        case state
        case head
        
    }
}
