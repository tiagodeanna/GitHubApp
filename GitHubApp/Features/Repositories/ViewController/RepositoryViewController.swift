import UIKit

final class RepositoriesViewController: UIViewController {
    private lazy var repositoriesView: RepositoriesView = {
        let view = RepositoriesView()
        return view
    }()
    
    private lazy var viewModel: RepositoryViewModel  = {
        let viewModel = RepositoryViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func loadView() {
        super.loadView()
        view = repositoriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GitHub JavaPop"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.searchRepositories(with: "Java")
    }
}

extension RepositoriesViewController: RepositoryViewModelDelegate {
       func showRepositoryData(of data: RepositoryData) {
        repositoriesView.update(with: data)
    }
    
    func showEmpty() {
        print("showEmpty")
    }
    
    func showError(message: String?) {
        print(message ?? String())
    }
}
