import UIKit

extension UILabel {
    func setDifferentColor(of string: String, until character: String = "/") {
        if let range = string.range(of: character) {
            let substring = String(string[..<range.lowerBound])
            let rangeOfString = (string as NSString).range(of: substring)
            let mutableAttributedString = NSMutableAttributedString.init(string: string)
            mutableAttributedString.addAttribute(
                NSAttributedString.Key.foregroundColor,
                value: UIColor.systemOrange,
                range: rangeOfString
            )
            attributedText = mutableAttributedString
        } else {
            text = string
        }
    }
}
