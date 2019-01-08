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
    var config: CustomAlertConfig = .default

    func addAlertView(_ alert: UIView) {
        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 9.0, *) {
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -config.viewCenterYOffset).isActive = true

            let viewSize = view.bounds.size
            let width = min(viewSize.width-2*config.horizontalOffset, alert.bounds.width)

            alert.widthAnchor.constraint(equalToConstant: width).isActive = true

            if let topOffset = config.verticalOffset {
                if #available(iOS 11.0, *) {
                    alert.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topOffset).isActive = true
                } else {
                    alert.topAnchor.constraint(equalTo: view.topAnchor, constant: topOffset).isActive = true
                }
            }
        } else {
            // Fallback on earlier versions
        }

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
        UIView.animate(withDuration: 0.4) {
            alertView.alpha = 1.0
        }
    }
}

extension CustomAlertController: CustomAlertDelegate {
    internal func dismissAlert(animated: Bool = true) {
        dismiss(animated: animated, completion: nil)
    }
}
