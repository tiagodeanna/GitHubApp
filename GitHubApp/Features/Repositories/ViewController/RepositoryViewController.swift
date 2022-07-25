import UIKit
import SnapKit

final class RepositoryViewController: UIViewController {
    
    private let repositoryView: RepositoryView = .init()
    
    private lazy var viewModel: RepositoryViewModel = {
        let viewModel = RepositoryViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func loadView() {
        super.loadView()
        view = repositoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureViews()
//        let service = RepostoriesService()
//        service.getRepositories { (result) in
//        }
    }
    
    func configureViews() {
        title = "Github App"
    }
}

extension RepositoryViewController: RepositoryViewModelDelegate {
    func showRepositories(of repositories: [Repository]) {
        repositoryView.update(with: repositories)

    }
}
extension RepositoryViewController: RepositoryDelegate {
    func didSelectRepository() {
         let secondViewController = PullRequestViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

