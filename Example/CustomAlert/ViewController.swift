//
//  ViewController.swift
//  CustomAlert
//
//  Created by shirokova on 09/11/2017.
//  Copyright (c) 2017 shirokova. All rights reserved.
//

import UIKit
import CustomAlert

final class ViewController: UIViewController {
    @IBAction func showAlert(_ sender: Any) {
        guard let alertView = Bundle.main.loadNibNamed("MyCustomAlertView", owner: view, options: nil)?[0] as? MyCustomAlertView else {
            fatalError("Nib doesn't exist")
        }
        let alert = CustomAlert { () -> UIView in
            return alertView
        }
        alert.present()
    }
}

