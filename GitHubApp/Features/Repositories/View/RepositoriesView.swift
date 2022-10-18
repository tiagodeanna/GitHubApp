import UIKit
import SnapKit

protocol RepositoriesViewDelegate: AnyObject {
    func didSelect(repo: Repository)
    func didPrefetchRowsAt(indexPaths: [IndexPath])
}

final class RepositoriesView: UIView {
    weak var delegate: RepositoriesViewDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        tableView.register(cellType: RepositoriesViewCell.self)
        tableView.rowHeight = 200
        return tableView
    }()
    
    private var repositories: [Repository] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with items: [Repository]) {
        repositories = items
        tableView.reloadData()
    }
}

extension RepositoriesView: ViewCode {
    func buildHierarchy() {
        addSubviews(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

extension RepositoriesView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        repositories.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: RepositoriesViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.updateView(with: repositories[indexPath.row])
        return cell
    }
}

extension RepositoriesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(repo: repositories[indexPath.row])
    }
}

extension RepositoriesView: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        delegate?.didPrefetchRowsAt(indexPaths: indexPaths)
    }
}
