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
    
    private var perfilImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        image.backgroundColor = .yellow
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "User Name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.backgroundColor = .yellow
        return nameLabel
    }()
    
    private let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Name Surname"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 10)
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .center
        fullNameLabel.numberOfLines = 0
        fullNameLabel.backgroundColor = .yellow
        return fullNameLabel
    }()
    
    private let forkImageView: UIImageView = {
       let forkImage = UIImageView()
        forkImage.contentMode = .scaleAspectFill
        forkImage.layer.masksToBounds = true
        forkImage.backgroundColor = .yellow
        return forkImage
    }()
    
    private let branchcounterLabel: UILabel = {
        let branchLabel = UILabel()
        branchLabel.text = "58"
        branchLabel.font = UIFont.boldSystemFont(ofSize: 12)
        branchLabel.textColor = .black
        branchLabel.textAlignment = .center
        branchLabel.numberOfLines = 0
        branchLabel.backgroundColor = .orange
        return branchLabel
    }()
    
    private let starcounterLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.text = "12"
        starLabel.font = UIFont.boldSystemFont(ofSize: 12)
        starLabel.textColor = .black
        starLabel.textAlignment = .center
        starLabel.numberOfLines = 0
        starLabel.backgroundColor = .blue
        return starLabel
    }()
    
    private let starImageView: UIImageView = {
       let starImage = UIImageView()
        starImage.contentMode = .scaleAspectFill
        starImage.layer.masksToBounds = true
        starImage.backgroundColor = .yellow
        return starImage
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
            make.top.equalTo(userNameLabel.snp.bottom).offset(6)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.equalTo(96)
        }
        
        perfilImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-64)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.height.equalTo(80)
            make.width.equalTo(80)
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
        backgroundColor = .red
        selectionStyle = .none
    }
}
