import Foundation

import Foundation

protocol PullRequestViewModelDelegate: AnyObject {
    func showContent(of pulls: [PullRequest], headerTitle: String?)
    func showEmpty()
    func showError(message: String?)
    func startLoading()
    func stopLoading()
    func hideEmpty()
}

final class PullRequestViewModel {
    weak var delegate: PullRequestViewModelDelegate?
    
    private let service: PullRequestServiceProtocol
    
    init(service: PullRequestServiceProtocol = PullRequestService()) {
        self.service = service
    }
    
    func getPullRequests(of repo: Repository) {
        delegate?.startLoading()
        service.getPullRequests(of: repo) { [weak self] result in
            guard let self = self else { return }
            self.delegate?.stopLoading()
            switch result {
            case let .success(pulls):
                if !pulls.isEmpty {
                    let openedCount = pulls.filter({ $0.state == "open" }).count
                    let closedCount = pulls.filter({ $0.state == "closed" }).count
                    let header = "\(openedCount) opened / \(closedCount) closed"
                    self.delegate?.showContent(of: pulls, headerTitle: header)
                } else {
                    self.delegate?.showEmpty()
                }
            case let .failure(error):
                self.delegate?.showError(message: error.localizedDescription)
            }
        }
    }
}
