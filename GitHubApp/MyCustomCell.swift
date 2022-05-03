import SnapKit
import UIKit

final class MyCustomCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .yellow
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let infolabel = UILabel()
        infolabel.text = "description"
        infolabel.font = UIFont.boldSystemFont(ofSize: 12)
        infolabel.textColor = .black
        infolabel.backgroundColor = .yellow
        infolabel.textAlignment = .center
        infolabel.numberOfLines = 0
        return infolabel
    }()
    
    private let perfilImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        image.backgroundColor = .yellow
        return image
    }()
    
    private let userName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "User Name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.backgroundColor = .yellow
        return nameLabel
    }()
    
    private let fullName: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Name Surname"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 10)
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .center
        fullNameLabel.numberOfLines = 0
        fullNameLabel.backgroundColor = .yellow
        return fullNameLabel
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
    
    func update(title: String) {
        titleLabel.text = title
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(perfilImage)
        contentView.addSubview(userName)
        contentView.addSubview(fullName)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.right.equalTo(perfilImage.snp.left).offset(-42)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.height.equalTo(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.right.equalTo(perfilImage.snp.right).offset(-120)
            make.height.equalTo(40)
        }
        
        fullName.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(4)
            make.right.equalTo(contentView.snp.right).offset(-6)
            make.width.equalTo(96)
        }
        
        perfilImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(6)
            make.bottom.equalTo(contentView.snp.bottom).offset(-64)
            make.right.equalTo(contentView.snp.right).offset(-12)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(perfilImage.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-12)
            make.height.equalTo(24)
            make.width.equalTo(80)
        }
    }
    
    private func configureViews() {
        backgroundColor = .red
        selectionStyle = .none
    }
}
