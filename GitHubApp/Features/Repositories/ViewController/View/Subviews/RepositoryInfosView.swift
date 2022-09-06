import UIKit
import SnapKit

final class RepositoryInfosView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let forkImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_fork"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .yellow
        imageView.setImageTintColor(.orange)
        return imageView
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_star"))
        imageView.contentMode = .scaleAspectFit
        imageView.setImageTintColor(.orange)
        return imageView
    }()
    
    private let forkLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let starLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with repository: Repository?) {
        forkLabel.text = "\(repository?.forksCount ?? 00)"
        starLabel.text = "\(repository?.stargazersCount ?? 00)"
    }
    
}

extension RepositoryInfosView: ViewCode {
    func buildHierarchy() {
        stackView.addSubviews(
            forkImageView,
            forkLabel,
            starImageView,
            starLabel
        )
        addSubviews(stackView)
    }
    
    func setupConstraints() {
        forkImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(snp.left)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        forkLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(forkImageView.snp.right).offset(8)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(forkLabel.snp.right).offset(8)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        starLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(starImageView.snp.right).offset(8)
            make.right.lessThanOrEqualTo(snp.right).offset(-8)
        }
    }
}
