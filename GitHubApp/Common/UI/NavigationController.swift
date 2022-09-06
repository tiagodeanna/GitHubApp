import UIKit

open class NavigationController: UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
