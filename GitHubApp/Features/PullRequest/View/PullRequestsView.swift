import UIKit

protocol PullRequestsViewDelegate: AnyObject {
    func didSelect(pull: PullRequest)
}

final class PullRequestsView: UIView {
    weak var delegate: PullRequestsViewDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: PullRequestsViewCell.self)
        tableView.register(headerFooterViewType: PullRequestHeaderView.self)
        tableView.rowHeight = 200
        return tableView
    }()
    
    private var pulls: [PullRequest] = []
    private var headerTitle: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with pulls: [PullRequest], headerTitle: String?) {
        self.pulls = pulls
        self.headerTitle = headerTitle
        tableView.reloadData()
    }
}

extension PullRequestsView: ViewCode {
    func buildHierarchy() {
        addSubviews(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

extension PullRequestsView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        pulls.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: PullRequestsViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.updateView(with: pulls[indexPath.row])
        return cell
    }
}

extension PullRequestsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: PullRequestHeaderView = tableView.dequeueHeaderFooterView()
        header.updateView(title: headerTitle ?? String())
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let headerTitle = headerTitle, !headerTitle.isEmpty {
            return 64
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(pull: pulls[indexPath.row])
    }
}
