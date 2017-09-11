//
//  ViewController.swift
//  CustomAlert
//
//  Created by shirokova on 09/11/2017.
//  Copyright (c) 2017 shirokova. All rights reserved.
//

import UIKit
import CustomAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: Any) {
        guard let alertView = Bundle.main.loadNibNamed("MyCustomAlertView", owner: view, options: nil)?[0] as? MyCustomAlertView else {
            fatalError("Nib doesn't exist")
        }
        let alert = CustomAlert(with: alertView)
        present(alert, animated: true, completion: nil)
    }
}

