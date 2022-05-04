import SnapKit
import UIKit

final class PullRequestViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .darkGray
        tableView.backgroundColor = .clear
        tableView.rowHeight = 150
        tableView.register(PullRequestViewCell.self, forCellReuseIdentifier: "RequestCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        pullrequestsetupView()
    }
    
    private func pullrequestsetupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func configureViews() {
        title = "Lista Pull Request"
        view.backgroundColor = .white
        
    }
}

extension PullRequestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as? PullRequestViewCell else {
            return UITableViewCell()
        }
            return cell
        }
    }

extension PullRequestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.popViewController(animated: true)
    }
}
