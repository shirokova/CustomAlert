//
//  MyCustomAlertView.swift
//  CustomAlert
//
//  Created by Anna Shirokova on 11/09/2017.
//  Copyright © 2017 shirokova. All rights reserved.
//

import CustomAlert

final class MyCustomAlertView: CustomAlertView {
    @IBAction func tapCloseButton(_ sender: Any) {
        delegate?.dismissAlert(animated: true)
    }
}
