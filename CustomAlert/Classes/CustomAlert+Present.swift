//
//  UIViewController+CustomAlert.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

extension UIViewController {
    @available(iOS, deprecated, message: "Use `public static func present<T:UIView>(_ customAlertToPresent: CustomAlert<T>, animated flag: Bool, completion: (() -> Swift.Void)? = nil)` instead.")
    public func present<T:UIView>(_ customAlertToPresent: CustomAlert<T>, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        customAlertToPresent.present(animated: flag, completion: completion)
    }
}

extension CustomAlert {
    public func present(animated flag: Bool = true, completion: (() -> Swift.Void)? = nil) {
        let controller = self.alertController
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        controller.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        controller.previousWindow = UIApplication.shared.keyWindow
        
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()

        vc.present(controller, animated: flag, completion: completion)
        vc.presentedViewController?.removeFromParent()
    }
}
