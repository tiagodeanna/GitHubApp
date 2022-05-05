import SnapKit
import UIKit

final class RepositoryViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis sodales augue, rhoncus finibus mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let perfilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray3
        label.textAlignment = .center
        return label
    }()
    
    private let forkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setImageTintColor(.red)
        return imageView
    }()
    
    private let branchCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "640"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemOrange
        return label
    }()
    
    private let starCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "98"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemOrange
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        configureViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String, perfilImage: String, forkImage: String, starImage: String) {
        //        titleLabel.text = title
        perfilImageView.image = UIImage(named: perfilImage)
        starImageView.image = UIImage(named: starImage)
        forkImageView.image = UIImage(named: forkImage)
        
        starImageView.image = starImageView.image?.withTintColor(.systemOrange)
        forkImageView.image = forkImageView.image?.withTintColor(.systemOrange)
    }
    
    private func setupConstraints() {
        let subviews = [
            titleLabel,
            descriptionLabel,
            perfilImageView,
            userNameLabel,
            fullNameLabel,
            forkImageView,
            branchCounterLabel,
            starImageView,
            starCounterLabel,
        ]
        subviews.forEach(contentView.addSubview)
        
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.right.equalTo(userNameLabel.snp.left).offset(-8)
            make.left.equalTo(contentView.snp.left).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.greaterThanOrEqualTo(branchCounterLabel.snp.top).offset(-8)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        perfilImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.bottom.equalTo(userNameLabel.snp.top).offset(-8)
            make.left.equalTo(userNameLabel.snp.left).offset(16)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
        
        userNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        userNameLabel.snp.makeConstraints { make in
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.left.equalTo(titleLabel.snp.right).offset(8)
            make.height.equalTo(24)
            make.width.greaterThanOrEqualTo(90)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.left.equalTo(userNameLabel.snp.left)
            make.width.equalTo(96)
        }
        
        forkImageView.snp.makeConstraints { make in
            make.centerY.equalTo(branchCounterLabel.snp.centerY)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        branchCounterLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
            make.left.equalTo(forkImageView.snp.right).offset(4)
            make.right.equalTo(starImageView.snp.left).offset(-32)
            make.height.greaterThanOrEqualTo(24)
        }
        
        starImageView.snp.makeConstraints { make in
            make.centerY.equalTo(branchCounterLabel.snp.centerY)
            make.left.equalTo(branchCounterLabel.snp.right).offset(4)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        starCounterLabel.snp.makeConstraints { make in
            make.centerY.equalTo(branchCounterLabel.snp.centerY)
            make.left.equalTo(starImageView.snp.right).offset(4)
        }
    }
    
    private func configureViews() {
        backgroundColor = .white
        selectionStyle = .none
    }
    
}

extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImageView {
    
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = tintedImage
        self.tintColor = color
    }
}
