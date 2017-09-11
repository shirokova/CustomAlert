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

public class CustomAlert {
    let alertController: CustomAlertController

    public init<T: UIView>(with view: T) {
        alertController = CustomAlertController()
        alertController.addAlertView(view)
        (view as? CustomAlertView)?.delegate = alertController
    }

    public func dismiss() {
        alertController.dismissAlert()
    }
}
