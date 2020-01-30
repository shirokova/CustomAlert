//
//  UIViewController+CustomAlert.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

import UIKit

public protocol CustomAlertDelegate: class {
    func dismissAlert(animated: Bool)
    func dismissAlert(animated: Bool, completion: @escaping () -> Void)
}

open class CustomAlertView: UIView {
    public weak var delegate: CustomAlertDelegate?
}

public class CustomAlert {
    let config: CustomAlertConfig
    let builder: () -> UIView

    static var globalPresentationWindow: UIWindow?
    private var alertController: CustomAlertController!
    var alertView: UIView!

    public var isPresented: Bool {
        return alertController?.presentingViewController != nil
    }

    func createAlertController() -> CustomAlertController {
        alertController = CustomAlertController()
        alertController!.config = config
        alertView = builder()
        alertController!.addAlertView(alertView)
        (alertView as? CustomAlertView)?.delegate = alertController
        return alertController!
    }

    public init(config: CustomAlertConfig = .default, builder: @escaping () -> UIView) {
        self.config = config
        self.builder = builder
    }

    public func dismiss(animated: Bool = true) {
        alertController.dismissAlert(animated: animated) { [weak self] in
            self?.alertController = nil
            self?.alertView = nil
        }
    }
}
