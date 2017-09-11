//
//  UIViewController+CustomAlert.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

extension UIViewController {
    public func present(_ customAlertToPresent: CustomAlert, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        let controller = customAlertToPresent.alertController
        controller.providesPresentationContextTransitionStyle = true
        controller.definesPresentationContext = true
        controller.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        controller.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(controller, animated: flag, completion: completion)
    }
}
