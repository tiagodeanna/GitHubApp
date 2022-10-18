import UIKit
import Reusable

final class PullRequestHeaderView: UITableViewHeaderFooterView, Reusable {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(title: String) {
        titleLabel.setDifferentColor(of: title)
    }
}

extension PullRequestHeaderView: ViewCode {
    func buildHierarchy() {
        contentView.addSubviews(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
}
