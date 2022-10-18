import UIKit
import Lottie
import SnapKit

final class LaunchViewController: UIViewController {
    private let animationView = AnimationView(name: "github_circle")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(animationView)
        animationView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width / 2)
            make.centerX.centerY.equalToSuperview()
        }
        
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }
}
