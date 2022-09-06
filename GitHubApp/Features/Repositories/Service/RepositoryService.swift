import Foundation

protocol RepositoryServiceProtocol: AnyObject {
    func getRepositories(query: String, page: Int,completion: @escaping (Result<Data?, Error>) -> Void)
}

final class RepositoryService: RepositoryServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getRepositories(
        query: String,
        page: Int,
        completion: @escaping (Result<Data?, Error>) -> Void
    ) {
        session.dataTask(with: Endpoint.repositories(query: query, page: page).url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    do {
                        if let data = data {
                            _ = try JSONDecoder().decode(RepositoryData.self, from: data)
                            completion(.success(data))
                            print(data.prettyPrintedJSONString ?? "")
                        }
                    } catch {
                        print(error)
                        completion(.failure(error))
                    }
                }
            }
        }.resume()
    }
}
