//
//  UIViewController+CustomAlert.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

import UIKit

public protocol CustomAlertDelegate: class {
    func dismissAlert()
}

open class CustomAlertView: UIView {
    public weak var delegate: CustomAlertDelegate?
}

public class CustomAlert<T: UIView> {
    let alertController: CustomAlertController
    public let alertView: T

    public init(with view: T, viewCenterYOffset: CGFloat = 0) {
        alertController = CustomAlertController()
        alertView = view
        alertController.addAlertView(view, centerYOffset: viewCenterYOffset)
        (view as? CustomAlertView)?.delegate = alertController
    }

    public func dismiss() {
        alertController.dismissAlert()
    }
}
