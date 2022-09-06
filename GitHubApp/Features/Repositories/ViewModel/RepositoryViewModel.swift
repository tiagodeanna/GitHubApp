import Foundation

protocol RepositoryViewModelDelegate: AnyObject {
    func showRepositoryData(of data: RepositoryData)
    func showEmpty()
    func showError(message: String?)
}

protocol RepositoryViewModelProtocol: AnyObject {
    func getRepositories()
}

final class RepositoryViewModel {
    weak var delegate: RepositoryViewModelDelegate?
    
    private let service: RepositoryServiceProtocol
    
    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
    }
    
    func searchRepositories(with query: String?, at page: Int = 1) {
        guard let query = query, !query.isEmpty else {
            delegate?.showEmpty()
            return
        }
        
        service.getRepositories(query: query, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                guard let data = data else {
                    self.delegate?.showError(message: "Nenhum dado encontrado")
                    return
                }
                
                do {
                    let repositoryData = try JSONDecoder().decode(RepositoryData.self, from: data)
                    self.delegate?.showRepositoryData(of: repositoryData)
                } catch(let error) {
                    print(error)
                    self.delegate?.showError(message: "Problema ao fazer o parse")
                }
//                guard let repositories = try? JSONDecoder().decode(Repositories.self, from: data) else {
//                    self.delegate?.showError(message: "Problema ao fazer o parse")
//                    return
//                }
//
//                self.delegate?.showContent(of: repositories)
                
            case let .failure(error):
                self.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
}
