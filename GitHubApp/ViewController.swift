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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        setupView()
        viewDidLayoutSubviews()
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
        cell.textLabel?.text = "Name Repository: \(indexPath.row)"
        cell.imageView?.image = UIImage(named: "perfil")
        cell.backgroundColor = .white
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
