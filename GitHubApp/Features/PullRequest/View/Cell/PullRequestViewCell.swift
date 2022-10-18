import UIKit
import Reusable

final class PullRequestsViewCell: UITableViewCell, Reusable {
    private let descriptionView: RepositoryDescriptionView = {
        let view = RepositoryDescriptionView()
        return view
    }()
    
    private let authorView: RepositoryAuthorView = {
        let view = RepositoryAuthorView(axis: .horizontal)
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
    
    func updateView(with pull: PullRequest) {
        descriptionView.updateView(with: pull)
        authorView.updateView(with: pull)
    }
}

extension PullRequestsViewCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubviews(
            descriptionView,
            authorView
        )
    }
    
    func setupConstraints() {
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(24)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
        
        authorView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom)
            make.bottom.equalTo(contentView.snp.bottom).offset(-32)
            make.left.equalTo(contentView.snp.left).offset(16)
            make.right.equalTo(contentView.snp.right).offset(-16)
        }
    }
    
    func configureViews() {
        selectionStyle = .none
    }
}
