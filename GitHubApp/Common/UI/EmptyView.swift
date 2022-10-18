import UIKit
import Lottie

final class EmptyView: UIView {
    var tryAgainAction: (() -> Void)?
    
    private(set) lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        return view
    }()
    
    private(set) lazy var animationView: AnimationView = {
        let view = AnimationView(name: "empty")
        view.frame = bounds
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.animationSpeed = 1
        view.play()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Oops!"
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Não foi possível encontar nenhum repositório :("
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tente novamente", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        overlayView.addSubview(animationView)
        overlayView.addSubview(titleLabel)
        overlayView.addSubview(descriptionLabel)
        overlayView.addSubview(tryAgainButton)
        
        addSubview(overlayView)
        
        overlayView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        overlayView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        animationView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        animationView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
        animationView.topAnchor.constraint(greaterThanOrEqualTo: overlayView.topAnchor).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor).isActive = true
        
        descriptionLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: overlayView.leftAnchor, constant: 32).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: overlayView.rightAnchor, constant: -32).isActive = true
        descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: tryAgainButton.topAnchor, constant: -32).isActive = true
        
        tryAgainButton.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -32).isActive = true
        tryAgainButton.leftAnchor.constraint(equalTo: overlayView.leftAnchor, constant: 32).isActive = true
        tryAgainButton.rightAnchor.constraint(equalTo: overlayView.rightAnchor, constant: -32).isActive = true
        tryAgainButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        tryAgainButton.layer.cornerRadius = 24
        tryAgainButton.addTarget(self, action: #selector(tapTryAgainButton), for: .touchUpInside)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play() {
        animationView.play()
    }
    
    func stop() {
        animationView.stop()
    }

    @objc
    private func tapTryAgainButton() {
        tryAgainAction?()
    }
}
