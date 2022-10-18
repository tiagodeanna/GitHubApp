import UIKit
import Lottie

final class LoadingView: UIView {
    private(set) lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        return view
    }()

    private(set) lazy var spinnerView: AnimationView = {
        let view = AnimationView(name: "loading")
        view.frame = bounds
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.animationSpeed = 1.5
        view.play()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        overlayView.addSubview(spinnerView)
        addSubview(overlayView)
    
        overlayView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        overlayView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        spinnerView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        spinnerView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play() {
        spinnerView.play()
    }
    
    func stop() {
        spinnerView.stop()
    }
}
//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Tiago Deanna on 11/10/22.
//

import Foundation
