import UIKit
import SnapKit

final class RepositoryDescriptionView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
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
    
    func update(with repository: Repository) {
        titleLabel.text = repository.name
        descriptionLabel.text = repository.description
    }
    
    func updateView(with pull: PullRequest) {
        titleLabel.text = pull.title
        descriptionLabel.text = pull.head?.repo?.description
    }
}

extension RepositoryDescriptionView: ViewCode {
    func buildHierarchy() {
        addSubviews(stackView)
        stackView.addSubviews(
            titleLabel,
            descriptionLabel
        )
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top)
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.lessThanOrEqualTo(stackView.snp.bottom)
            make.left.equalTo(stackView.snp.left)
            make.right.equalTo(stackView.snp.right)
        }
    }
}

