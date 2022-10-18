import Foundation

protocol RepositoriesViewModelDelegate: AnyObject {
    func showContent(of items: [Repository])
    func showEmpty()
    func showError(message: String?)
    func startLoading()
    func stopLoading()
    func hideEmpty()
}

final class RepositoriesViewModel {
    weak var delegate: RepositoriesViewModelDelegate?
    
    private var currentPage: Int
    private var currentItems: [Repository]
    private var isRequestInProgress: Bool
    private let service: RepositoryServiceProtocol
    
    init(service: RepositoryServiceProtocol = RepositoryService()) {
        self.service = service
        self.currentPage = 1
        self.currentItems = []
        self.isRequestInProgress = false
    }
    
    func searchRepositories(with query: String?, at page: Int = 1) {
        guard !isRequestInProgress else {
            return
        }
        
        guard let query = query, !query.isEmpty else {
            delegate?.showEmpty()
            return
        }
        
        isRequestInProgress = true
        delegate?.startLoading()
        service.getRepositories(query: query, page: currentPage) { [weak self] result in
            guard let self = self else { return }
            
            self.delegate?.stopLoading()
            self.isRequestInProgress = false
            
            switch result {
            case let .success(repositories):
                if let items = repositories.items, !items.isEmpty {
                    self.currentItems.append(contentsOf: items)
                    self.delegate?.showContent(of: self.currentItems)
                } else {
                    self.delegate?.showEmpty()
                }
            case let .failure(error):
                self.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func loadNextPage(for query: String?, with indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            currentPage += 1
            searchRepositories(with: query, at: currentPage)
        }
    }
    
    private func isLoadingCell(for indexPath: IndexPath) -> Bool {
        indexPath.row >= currentItems.count - 10
    }
}
