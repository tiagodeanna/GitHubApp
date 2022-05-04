import SnapKit
import UIKit

final class RepositoryViewCell: UITableViewCell {
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
        image.layer.cornerRadius = 32
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
    
    private let forkImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.backgroundColor = .clear
        return image
    }()
    
    private let branchcounterLabel: UILabel = {
        let label = UILabel()
        label.text = "640"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemOrange
        label.numberOfLines = 1
        label.backgroundColor = .clear
        return label
    }()
    
    private let starcounterLabel: UILabel = {
        let label = UILabel()
        label.text = "98"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemOrange
        label.numberOfLines = 1
        label.backgroundColor = .clear
        return label
    }()
    
    private let starImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.backgroundColor = .clear
        return image
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
        titleLabel.text = title
        perfilImageView.image = UIImage(named: perfilImage)
        starImageView.image = UIImage(named: starImage)
        forkImageView.image = UIImage(named: forkImage)
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(perfilImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(forkImageView)
        contentView.addSubview(branchcounterLabel)
        contentView.addSubview(starImageView)
        contentView.addSubview(starcounterLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.right.equalTo(perfilImageView.snp.left).offset(-42)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.height.equalTo(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.right.equalTo(perfilImageView.snp.right).offset(-120)
            make.height.equalTo(40)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.equalTo(96)
        }
        
        perfilImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-68)
            make.right.equalTo(contentView.snp.right).offset(-24)
            make.height.equalTo(35)
            make.width.equalTo(60)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(perfilImageView.snp.bottom).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.height.equalTo(24)
            make.width.equalTo(80)
        }
        
        forkImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.width.equalTo(32)
        }
        
        branchcounterLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
            make.left.equalTo(forkImageView.snp.right).offset(4)
            make.width.equalTo(80)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
            make.left.equalTo(branchcounterLabel.snp.right).offset(4)
            make.width.equalTo(32)
        }
        
        starcounterLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
            make.left.equalTo(starImageView.snp.right).offset(4)
            make.width.equalTo(80)
        }
    }
    
    private func configureViews() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
}
