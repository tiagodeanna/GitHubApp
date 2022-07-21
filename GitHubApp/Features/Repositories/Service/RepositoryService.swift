import Foundation

protocol RepostoriesServiceProtocol: AnyObject {
    func getRepositories(completion: @escaping (Result<Repositories?, Error>) -> Void)
}

final class RepostoriesService: RepostoriesServiceProtocol {
    func getRepositories(completion: @escaping (Result<Repositories?, Error>) -> Void) {
        URLSession.shared.dataTask(with: Endpoint.repositories.url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    do {
                        if let data = data {
                            let jsonDecoded = try JSONDecoder().decode(Repositories.self, from: data)
                            completion(.success(jsonDecoded))
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
