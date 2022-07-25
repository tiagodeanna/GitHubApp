protocol RepositoryViewModelDelegate: AnyObject {
    func showRepositories(of repositories: [Repository])
}

final class RepositoryViewModel {
    weak var delegate: RepositoryViewModelDelegate?
    
    private let service: RepostoriesServiceProtocol
    
    init(service: RepostoriesServiceProtocol =
            RepostoriesService()) {
        self.service = service
    }
    
}
