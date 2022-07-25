import UIKit

protocol RepositoryDelegate: AnyObject {
    func didSelectRepository()
}

final class RepositoryView: UIView {
    weak var delegate: RepositoryDelegate?
    private var repository: [Repository] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 184
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(RepositoryViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        tableView.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.top)
            make.bottom.equalTo(tableView.snp.bottom)
            make.left.equalTo(tableView.snp.left)
            make.right.equalTo(tableView.snp.right)
        }
    }
    
    func update(with repository: [Repository]) {
        self.repository = repository
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension RepositoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RepositoryViewCell else {
            return UITableViewCell()
        }
        cell.updateView(with: repository)
        cell.update(
            title: "Nome Repositório",
            perfilImage: "usuario",
            forkImage: "fork",
            starImage: "estrela"
        )
        return cell
    }
    
}

extension RepositoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRepository()
    }
}
