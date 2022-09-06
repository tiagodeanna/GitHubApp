import UIKit

extension CGFloat {
    var proportionalToWidth: CGFloat {
        self * UIScreen.widthProportion
    }
}
