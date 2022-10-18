import UIKit

final class PullRequestsViewController: UIViewController, Loadable, Errable, Emptyble {
    private lazy var pullRequestsView: PullRequestsView = {
        let view = PullRequestsView()
        view.delegate = self
        return view
    }()
    
    private lazy var viewModel: PullRequestViewModel = {
        let viewModel = PullRequestViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private let repo: Repository
    
    init(repo: Repository) {
        self.repo = repo
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = pullRequestsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = repo.name
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonTitle = String()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPullRequests(of: repo)
    }
}

extension PullRequestsViewController: PullRequestViewModelDelegate {
    func showContent(of pulls: [PullRequest], headerTitle: String?) {
        pullRequestsView.updateView(with: pulls, headerTitle: headerTitle)
    }
    
    func showEmpty() {
        showEmpty { [weak self] in
            guard let self = self else { return }
            self.viewModel.getPullRequests(of: self.repo)
            self.hideEmpty()
        }
    }
    
    func showError(message: String?) {
        showError(message: message) { [weak self] in
            guard let self = self else { return }
            self.viewModel.getPullRequests(of: self.repo)
            self.hideError()
        }
    }
}

extension PullRequestsViewController: PullRequestsViewDelegate {
    func didSelect(pull: PullRequest) {
        let application = UIApplication.shared
        if let htmlURL = pull.htmlURL, let url = URL(string: htmlURL), application.canOpenURL(url) {
            application.open(url)
        }
    }
}
