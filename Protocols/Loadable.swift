import UIKit
import Lottie

protocol Loadable {
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {
    func startLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            // let shimmerView: RepositoriesShimmerView = .loadFromNib()
            // shimmerView.tag = shimmerViewTag
            
            let loadingView = LoadingView()
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            loadingView.backgroundColor = .white
            loadingView.alpha = 1
            loadingView.tag = StateTagConstant.loading
            
            self.view.removeAllFromSuperview(with: StateTagConstant.loading)
            self.view.addSubview(loadingView)
            
            loadingView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
            loadingView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            loadingView.play()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let loadingView = self.view.viewWithTag(StateTagConstant.loading) as? LoadingView else {
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                loadingView.overlayView.alpha = 0.0
                loadingView.stop()
            }  completion: { _ in
                loadingView.removeFromSuperview()
            }
        }
    }
}
//
//  Loadable.swift
//  GitHubApp
//
//  Created by Tiago Deanna on 11/10/22.
//

import Foundation
