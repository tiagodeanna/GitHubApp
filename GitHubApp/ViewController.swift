import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 255
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .blue
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .red
        label.backgroundColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        viewDidLayoutSubviews()
        view.addSubview(self.titleLabel)
        configConstraints()
        setupView()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80),
        ])
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top
                .bottom
                .trailing
                .leading
                .equalToSuperview()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "Title: \(indexPath.row)"
        cell.imageView?.image = UIImage(named: "perfil")
        cell.backgroundColor = .yellow
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .white
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}
