import SnapKit
import UIKit

final class PullRequestViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .systemBlue
        label.backgroundColor = .clear
        label.numberOfLines = 2
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
        label.numberOfLines = 2
        label.backgroundColor = .clear
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String, perfilImage: String) {
        titleLabel.text = title
        perfilImageView.image = UIImage(named: perfilImage)
    }
    
     func setupConstraints() {
        let subviews = [
            titleLabel,
            descriptionLabel,
            perfilImageView,
            userNameLabel,
            fullNameLabel,
        ]
        subviews.forEach(contentView.addSubview)
        
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(contentView.snp.top).offset(16)
                make.left.equalTo(contentView.snp.left).offset(16)
                make.height.lessThanOrEqualTo(42)
            }
            
        descriptionLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(4)
                make.right.equalTo(contentView.snp.right).offset(-16)
                make.left.equalTo(titleLabel.snp.left)
            }
            
        perfilImageView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
            perfilImageView.snp.makeConstraints { make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
                make.bottom.equalTo(contentView.snp.bottom).offset(-16)
                make.left.equalTo(descriptionLabel.snp.left)
                make.height.equalTo(32)
                make.width.equalTo(32)
            }
            
            userNameLabel.snp.makeConstraints { make in
                make.top.equalTo(perfilImageView.snp.top)
                make.left.equalTo(perfilImageView.snp.right).offset(16)
                make.width.equalTo(90)
            }
            
            fullNameLabel.snp.makeConstraints { make in
                make.top.equalTo(userNameLabel.snp.bottom).offset(2)
                make.left.equalTo(userNameLabel.snp.left)
            }
            
        }
        
        func configureViews() {
            selectionStyle = .none
        }
    }
