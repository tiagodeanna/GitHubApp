import UIKit
import Lottie

protocol Emptyble {
    func showEmpty(tryAgainAction: (() -> Void)?)
    func hideEmpty()
}

extension Emptyble where Self: UIViewController {
    func showEmpty(tryAgainAction: (() -> Void)?) {
        DispatchQueue.main.async {
            let emptyView = EmptyView()
            emptyView.tryAgainAction = tryAgainAction
            emptyView.translatesAutoresizingMaskIntoConstraints = false
            emptyView.backgroundColor = .white
            emptyView.alpha = 1
            emptyView.tag = StateTagConstant.empty
            
            self.view.removeAllFromSuperview(with: StateTagConstant.empty)
            self.view.addSubview(emptyView)
            
            emptyView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
            emptyView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            emptyView.play()
        }
    }
    
    func hideEmpty() {
        DispatchQueue.main.async {
            guard let emptyView = self.view.viewWithTag(StateTagConstant.empty) as? EmptyView else { return }
            UIView.animate(withDuration: 0.2) {
                emptyView.overlayView.alpha = 0.0
                emptyView.stop()
            }  completion: { _ in
                emptyView.removeFromSuperview()
            }
        }
    }
}
