import UIKit

class MyCustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .link
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 300, y: 50, width: 100, height: 100)
        textLabel?.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        textLabel?.adjustsFontForContentSizeCategory = false
        
    }
}
