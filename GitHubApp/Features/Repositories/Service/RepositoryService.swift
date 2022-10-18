import Foundation

protocol RepositoryServiceProtocol: AnyObject {
    func getRepositories(query: String, page: Int, completion: @escaping (Result<Repositories, APIError>) -> Void)
}

final class RepositoryService: RepositoryServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getRepositories(
        query: String,
        page: Int,
        completion: @escaping (Result<Repositories, APIError>) -> Void
    ) {
        session.dataTask(with: Endpoint.repositories(query: query, page: page).url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.failed(error: error)))
                } else if let data = data {
                    data.parse(completion: completion)
                } else {
                    fatalError("Data veio como nil")
                }
            }
        }.resume()
    }
}
