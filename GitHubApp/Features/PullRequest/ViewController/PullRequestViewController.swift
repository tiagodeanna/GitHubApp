import UIKit

final class PullRequestsViewController: UIViewController {
    private lazy var pullRequestsView: PullRequestsView = {
        let view = PullRequestsView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = pullRequestsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = .white
    }
}
