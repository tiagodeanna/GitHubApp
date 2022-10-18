import UIKit

extension UIView {
    func removeAllFromSuperview(with tag: Int) {
        for subview in subviews where subview.tag == tag {
            subview.removeFromSuperview()
        }
    }
}
