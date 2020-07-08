//
//  SecureTextfieldViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAppSecurity

class SecureTextfieldViewController: UIViewController {
    
    @IBOutlet private var firstTextfield: UITextField!
    @IBOutlet private var secondTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func switchSecurites() {
        let securePlaceholder = "Secure Textfield"
        let regularPlaceholder = "Regular Textfield"
        firstTextfield.isSecure = !firstTextfield.isSecure
        firstTextfield.placeholder = firstTextfield.isSecure ? securePlaceholder : regularPlaceholder
        secondTextfield.isSecure = !secondTextfield.isSecure
        secondTextfield.placeholder = secondTextfield.isSecure ? securePlaceholder : regularPlaceholder
    }
    
}

extension SecureTextfieldViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
