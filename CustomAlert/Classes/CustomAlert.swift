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
}

open class CustomAlertView: UIView {
    public weak var delegate: CustomAlertDelegate?
}

public class CustomAlert<T: UIView> {
    let alertController: CustomAlertController
    public let alertView: T

    public init(with view: T, config: CustomAlertConfig = .default) {
        alertController = CustomAlertController()
        alertController.config = config
        alertView = view
        alertController.addAlertView(view)
        (view as? CustomAlertView)?.delegate = alertController
    }

    public func dismiss(animated: Bool = true) {
        alertController.dismissAlert(animated: animated)
    }
}
