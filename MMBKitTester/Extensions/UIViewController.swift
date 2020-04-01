//
//  UIViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 31.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, doneButton: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: doneButton, style: .default, handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }
    
}
