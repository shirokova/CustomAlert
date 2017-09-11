//
//  CustomAlertController.swift
//  Pods
//
//  Created by Anna Shirokova on 11/09/2017.
//
//

import UIKit

internal class CustomAlertController: UIViewController {
    var alertView: UIView?

    func addAlertView(_ alert: UIView) {
        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false

        alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alert.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let viewSize = view.bounds.size
        let width = min(viewSize.width-50, alert.bounds.width)
        alert.widthAnchor.constraint(equalToConstant: width).isActive = true

        alertView = alert
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }

    func setupView() {
        alertView?.layer.cornerRadius = 16
        alertView?.clipsToBounds = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    func animateView() {
        guard let alertView = alertView else {return }
        alertView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            alertView.alpha = 1.0
        })
    }
}

extension CustomAlertController: CustomAlertDelegate {
    internal func dismissAlert() {
        dismiss(animated: true, completion: nil)
    }
}
