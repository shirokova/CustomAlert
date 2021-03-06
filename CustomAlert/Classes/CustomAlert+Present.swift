//
//  UIViewController+CustomAlert.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

extension CustomAlert {
    public func present(animated flag: Bool = true, completion: (() -> Swift.Void)? = nil) {
        let controller = createAlertController()
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        controller.modalTransitionStyle = UIModalTransitionStyle.crossDissolve

        controller.previousWindow = UIApplication.shared.keyWindow

        CustomAlert.globalPresentationWindow = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        CustomAlert.globalPresentationWindow?.rootViewController = vc
        CustomAlert.globalPresentationWindow?.windowLevel = UIWindow.Level.alert + 1
        CustomAlert.globalPresentationWindow!.makeKeyAndVisible()

        vc.present(controller, animated: flag, completion: completion)
        vc.presentedViewController?.removeFromParent()
    }
}
