import UIKit
import Lottie

final class SceneDelegate: UIResponder, UIWindowSceneDelegate, CAAnimationDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let mainScene = (scene as? UIWindowScene) else { return }
        let launchViewController = LaunchViewController()
        let viewController = RepositoriesViewController()
        let navigationController = NavigationController(
            rootViewController: viewController
        )
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(rgb: 0x161a22)
        let titleAttribute = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = titleAttribute
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        self.window = UIWindow(frame: mainScene.coordinateSpace.bounds)
        self.window?.windowScene = mainScene
        self.window?.rootViewController = launchViewController
        self.window?.makeKeyAndVisible()
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            LaunchScreenAnimation.animate(
                sender: self,
                controller: navigationController,
                window: self.window
            )
            self.window?.rootViewController = navigationController
        }
    }
}
