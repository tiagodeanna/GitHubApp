import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .darkGray
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupView()
        configureViews()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func configureViews() {
            title = "Github App"
            view.backgroundColor = .white
        }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyCustomCell else {
            return UITableViewCell()
        }
        cell.update(
            title: "Title",
            perfilImage: "usuario",
            forkImage: "fork",
            starImage: "estrela"
            )
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .orange
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}
