import UIKit

final class PullRequestHeaderView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        let stringValue = "16 opened / 800 closed"
        let stringToColor = "16 opened"
        let range = (stringValue as NSString).range(of: stringToColor)
        let attributedString = NSMutableAttributedString(string: stringValue)
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.systemOrange,
            range: range
        )
        label.attributedText = attributedString
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
