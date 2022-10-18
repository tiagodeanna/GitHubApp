import Foundation

protocol PullRequestServiceProtocol: AnyObject {
    func getPullRequests(of repo: Repository, completion: @escaping (Result<[PullRequest], APIError>) -> Void)
}

final class PullRequestService: PullRequestServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getPullRequests(
        of repo: Repository,
        completion: @escaping (Result<[PullRequest], APIError>) -> Void
    ) {
        guard let ownerName = repo.owner?.login, let repoName = repo.name else { return }
        session.dataTask(with: Endpoint.pulls(ownerName: ownerName, repoName: repoName).url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.failed(error: error)))
                } else if let data = data {
                    data.parse(completion: completion)
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }.resume()
    }
}
