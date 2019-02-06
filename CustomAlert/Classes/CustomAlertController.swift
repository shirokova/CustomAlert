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

        alert.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        configureVerticalConstraints(for: alert)

        let viewSize = view.bounds.size
        let width = min(viewSize.width-2*config.horizontalOffset, alert.bounds.width)

        alert.widthAnchor.constraint(equalToConstant: width).isActive = true

        alertView = alert
    }

    private func configureVerticalConstraints(for alert: UIView) {
        switch config.verticalPosition {
        case let .center(topOffset, centerOffset):
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -centerOffset).isActive = true
            guard let topOffset = topOffset else { return }
            alert.topAnchor.constraint(equalTo: viewTopAnchor, constant: topOffset).isActive = true
        case let .top(offset):
            alert.topAnchor.constraint(equalTo: viewTopAnchor, constant: offset).isActive = true
        case let .bottom(offset):
            alert.bottomAnchor.constraint(equalTo: viewBottomAnchor, constant: -offset).isActive = true
        }
    }

    private var viewBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.bottomAnchor
        } else {
            return view.bottomAnchor
        }
    }

    private var viewTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        } else {
            return view.topAnchor
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }

    func setupView() {
        alertView?.layer.cornerRadius = config.cornerRadius
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
