import UIKit
import SnapKit
import Kingfisher

final class RepositoryAuthorView: UIView {
    enum Axis: Int {
        case horizontal = 0
        case vertical = 1
    }
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_avatar"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
            
    private(set) var axis: Axis = .vertical
    
    init(axis: Axis, frame: CGRect = .zero) {
        self.axis = axis
        super.init(frame: frame)
        setupViewCode()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods -
    
    func update(with repository: Repository) {
        usernameLabel.text = repository.owner?.login
        fullNameLabel.text = repository.fullName
        
        guard let avatarURL = repository.owner?.avatarURL, let url = URL(string: avatarURL) else {
            userImageView.image = UIImage(named: "ic_avatar")
            return
        }
        userImageView.kf.setImage(with: url)
    }
    
    // MARK: - Private Methods -
    
    private func setupVerticalConstraints() {
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(usernameLabel.snp.top).offset(-4)
            make.width.equalTo(56)
            make.height.equalTo(56)
            make.centerX.equalTo(snp.centerX)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.height.greaterThanOrEqualTo(24)
        }
    }
    
    private func setupHorizontalConstraints() {
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.left.equalTo(snp.left)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }

        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView.snp.centerY)
            make.left.equalTo(userImageView.snp.right).offset(16)
            make.right.equalTo(snp.right)
        }
    }
}

extension RepositoryAuthorView: ViewCode {
    func buildHierarchy() {
        stackView.addArrangedSubviews(usernameLabel, fullNameLabel)
        addSubviews(userImageView, stackView)
    }
    
    func setupConstraints() {
        axis == .vertical ? setupVerticalConstraints() : setupHorizontalConstraints()
    }
    
    func configureViews() {
        usernameLabel.textAlignment = axis == .vertical ? .center : .left
        fullNameLabel.textAlignment = axis == .vertical ? .center : .left
        userImageView.layer.cornerRadius = axis == .vertical ? 28 : 20
        userImageView.clipsToBounds = true
    }
}
