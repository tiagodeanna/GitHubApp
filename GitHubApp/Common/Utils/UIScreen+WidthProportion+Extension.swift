import UIKit

extension UIScreen {
    private static let iPhone6Width: CGFloat = 375
    
    static var widthProportion: CGFloat {
        main.bounds.width / iPhone6Width
    }
}
