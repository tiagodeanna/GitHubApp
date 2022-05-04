import SnapKit
import UIKit

final class PullRequestViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemBlue
        label.backgroundColor = .clear
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var perfilImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        image.backgroundColor = .systemGray4
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.numberOfLines = 2
        label.backgroundColor = .clear
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
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
    
    func update(title: String, perfilImage: String, description: String) {
        titleLabel.text = title
        perfilImageView.image = UIImage(named: perfilImage)
        descriptionLabel.text = description
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(perfilImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(fullNameLabel)
        
        func setupConstraints() {
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(contentView.snp.top).offset(8)
                make.left.equalTo(contentView.snp.left).offset(16)
                make.height.lessThanOrEqualTo(42)
            }
            
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(8)
                make.right.equalTo(contentView.snp.right).offset(-16)
                make.left.equalTo(titleLabel.snp.left)
            }
            
            perfilImageView.snp.makeConstraints { make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
                make.left.equalTo(descriptionLabel.snp.left)
                make.height.equalTo(50)
                make.width.equalTo(50)
            }
            
            userNameLabel.snp.makeConstraints { make in
                make.top.equalTo(perfilImageView.snp.top).offset(4)
                make.left.equalTo(perfilImageView.snp.right).offset(16)
                make.width.equalTo(90)
            }
            
            fullNameLabel.snp.makeConstraints { make in
                make.top.equalTo(userNameLabel.snp.bottom).offset(4)
                make.left.equalTo(userNameLabel.snp.left)
            }
            
        }
        
        func configureViews() {
            backgroundColor = .clear
            selectionStyle = .none
        }
    }
}
