import UIKit
import Lottie

protocol Errable {
    func showError(tryAgainAction: (() -> Void)?)
    func showError(message: String?, tryAgainAction: (() -> Void)?)
    func showError(title: String?, message: String?, tryAgainAction: (() -> Void)?)
    func hideError()
}

extension Errable where Self: UIViewController {
    private func show(errorView: ErrorView) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.removeAllFromSuperview(with: StateTagConstant.error)
            self.view.addSubview(errorView)
            
            errorView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
            errorView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            errorView.play()
        }
    }
    
    func showError(tryAgainAction: (() -> Void)?) {
        let errorView = StateAbstractFactory.createErrorView()
        errorView.tryAgainAction = tryAgainAction
        show(errorView: errorView)
    }
    
    func showError(message: String?, tryAgainAction: (() -> Void)?) {
        let errorView = StateAbstractFactory.createErrorView()
        errorView.tryAgainAction = tryAgainAction
        errorView.setError(message: message)
        show(errorView: errorView)
    }
    
    func showError(title: String?, message: String?, tryAgainAction: (() -> Void)?) {
        let errorView = StateAbstractFactory.createErrorView()
        errorView.tryAgainAction = tryAgainAction
        errorView.setError(title: title, message: message)
        show(errorView: errorView)
    }
    
    func hideError() {
        DispatchQueue.main.async {
            guard let emptyView = self.view.viewWithTag(StateTagConstant.error) as? ErrorView else { return }
            UIView.animate(withDuration: 0.2) {
                emptyView.overlayView.alpha = 0.0
                emptyView.stop()
            }  completion: { _ in
                emptyView.removeFromSuperview()
            }
        }
    }
}
