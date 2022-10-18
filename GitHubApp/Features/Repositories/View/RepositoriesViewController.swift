import UIKit
import Reusable

final class RepositoriesViewController: UIViewController, Loadable, Emptyble, Errable {
    private lazy var repositoriesView: RepositoriesView = {
        let view = RepositoriesView()
        view.delegate = self
        return view
    }()
    
    private lazy var viewModel: RepositoriesViewModel = {
        let viewModel = RepositoriesViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private var query: String? = "Java"
    
    override func loadView() {
        super.loadView()
        view = repositoriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHub JavaPop"
        viewModel.searchRepositories(with: query)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension RepositoriesViewController: RepositoriesViewDelegate {
    func didSelect(repo: Repository) {
        let viewController = PullRequestsViewController(repo: repo)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didPrefetchRowsAt(indexPaths: [IndexPath]) {
        viewModel.loadNextPage(for: query, with: indexPaths)
    }
}

extension RepositoriesViewController: RepositoriesViewModelDelegate {
    func showContent(of items: [Repository]) {
        repositoriesView.updateView(with: items)
    }
    
    func showEmpty() {
        showEmpty { [weak self] in
            self?.viewModel.searchRepositories(with: "Java")
            self?.hideEmpty()
        }
    }
    
    func showError(message: String?) {
        showError(message: message) { [weak self] in
            self?.viewModel.searchRepositories(with: "Java")
            self?.hideError()
        }
    }
}
