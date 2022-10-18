import UIKit

struct LaunchScreenAnimation {
    
    static func animate(sender: CAAnimationDelegate, controller: UINavigationController, window: UIWindow?) {
        let mask = self.startAnimation(controller: controller)
        self.endAnimation(sender: sender, controller: controller, window: window, mask: mask)
    }
    
    static func startAnimation(controller: UINavigationController) -> UIImageView {
        let logo = UIImage(named: "ic_logo")
        
        let mask: UIImageView = {
            let view = UIImageView(frame: controller.view.frame)
            view.image = logo
            view.bounds = CGRect(
                x: 0,
                y: 0,
                width: controller.view.frame.width / 2,
                height: controller.view.frame.width / 2
            )
            view.contentMode = .scaleAspectFit
            view.backgroundColor = .black
            return view
        }()
        
        controller.view.addSubview(mask)
        controller.view.bringSubviewToFront(mask)
        
        controller.view.layer.mask = CALayer()
        controller.view.layer.mask?.contents = logo?.cgImage
        controller.view.layer.mask?.bounds =  CGRect(
            x: 0,
            y: 0,
            width: (controller.view.frame.width / 2) - 10,
            height: (controller.view.frame.width / 2) - 10
        )
        controller.view.layer.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        controller.view.layer.mask?.position = CGPoint(
            x: controller.view.frame.width / 2,
            y: controller.view.frame.height / 2
        )
        controller.view.layer.mask?.cornerRadius = 16
        controller.view.layer.mask?.masksToBounds = true
        return mask
    }
    
    static func endAnimation(
        sender: CAAnimationDelegate,
        controller: UINavigationController,
        window: UIWindow?,
        mask: UIImageView
    ) {
        let transformAnimation : CAKeyframeAnimation = {
            let animation = CAKeyframeAnimation(keyPath: "bounds")
            animation.delegate = sender
            animation.duration = 1
            animation.beginTime = CACurrentMediaTime() + 1
            animation.keyTimes = [0, 0.5, 1]
            animation.timingFunctions = [
                CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
                CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            ]
            animation.isRemovedOnCompletion = false
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.values = [
                NSValue(cgRect: controller.view.layer.mask?.bounds ?? .zero),
                NSValue(cgRect: CGRect(x: 0, y: 0, width: 50, height: 50)),
                NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
            ]
            return animation
        }()
        
        controller.view.layer.mask?.add(transformAnimation, forKey: "maskAnimation")
        
        guard let window = window else {
            mask.removeFromSuperview()
            return
        }
        
        UIView.animate(
            withDuration: 0.1,
            delay: 1.25,
            options: UIView.AnimationOptions.curveEaseIn,
            animations: {
                mask.alpha = 0.0
            },
            completion: { finished in
                mask.removeFromSuperview()
            }
        )
        
        UIView.animate(
            withDuration: 0.25,
            delay: 1.3,
            options: [],
            animations: {
                window.rootViewController?.view.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            },
            completion: { finished in
                UIView.animate(
                    withDuration: 0.3,
                    delay: 0.0,
                    options: [.curveEaseInOut],
                    animations: {
                        window.rootViewController?.view.transform = CGAffineTransform.identity
                    },
                    completion: nil
                )
            }
        )
    }
    
}
