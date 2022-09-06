import UIKit
import Reusable

final class RepositoriesViewCell: UITableViewCell, Reusable {
    
    private let descriptionView: RepositoryDescriptionView = {
        let view = RepositoryDescriptionView()
        return view
    }()
    
    private let authorView: RepositoryAuthorView = {
        let view = RepositoryAuthorView(axis: .vertical)
        return view
    }()
    
    private let infosView: RepositoryInfosView = {
        let view = RepositoryInfosView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with repository: Repository) {
        descriptionView.update(with: repository)
        authorView.update(with: repository)
        infosView.update(with: repository)
    }
}

extension RepositoriesViewCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubviews(
            descriptionView,
            authorView,
            infosView
        )
    }
    
    func setupConstraints() {
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.bottom.equalTo(infosView.snp.top).offset(-8)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(authorView.snp.left).offset(-8)
        }
        
        infosView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-32)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.right.equalTo(authorView.snp.left).offset(-8)
            make.height.equalTo(24)
        }
        
        authorView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.top)
            make.bottom.lessThanOrEqualTo(infosView.snp.bottom)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.equalTo(contentView.snp.width).multipliedBy(0.3)
        }
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}

