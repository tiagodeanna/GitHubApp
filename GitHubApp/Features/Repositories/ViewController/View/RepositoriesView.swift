import UIKit
import SnapKit

final class RepositoriesView: UIView {
    
    private var repositories: [Repository] = []
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(cellType: RepositoriesViewCell.self)
        tableView.rowHeight = 200
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with data: RepositoryData) {
        repositories = data.repositories ?? []
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
