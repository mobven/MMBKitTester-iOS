//
//  SecureStoreWriteViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import AppSecurity

class SecureStoreWriteViewController: BaseTypeViewController {
    
    @IBOutlet private weak var keyTextfield: UITextField!
    @IBOutlet private weak var valueTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func save() {
        let type = pickerView.selectedRow(inComponent: 0)
        let key = keyTextfield.text!
        switch type {
        case 0:
            let boolValue = valueTextfield.text!.uppercased() == "YES"
            UserDefaults.standard.setSecureValue(boolValue, forKey: key)
        case 1:
            guard let intValue = Int(valueTextfield.text!) else { return }
            UserDefaults.standard.setSecureValue(intValue, forKey: key)
        case 2:
            guard let floatValue = Float(valueTextfield.text!) else { return }
            UserDefaults.standard.setSecureValue(floatValue, forKey: key)
        case 3:
            guard let doubleValue = Double(valueTextfield.text!) else { return }
            UserDefaults.standard.setSecureValue(doubleValue, forKey: key)
        case 4:
            UserDefaults.standard.setSecureValue(valueTextfield.text!, forKey: key)
        case 5:
            let url = URL(string: valueTextfield.text!)
            UserDefaults.standard.setSecureValue(url, forKey: key)
        default: return
        }
        UserDefaults.standard.synchronize()
    }
    
}

extension SecureStoreWriteViewController {
    
    override func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int, inComponent component: Int) {
        super.pickerView(pickerView, didSelectRow: row, inComponent: component)
        valueTextfield.text = ""
        valueTextfield.placeholder = pickerItems[row].placeholder
    }
    
}

extension SecureStoreWriteViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == keyTextfield {
            valueTextfield.becomeFirstResponder()
        } else if textField == valueTextfield {
            valueTextfield.resignFirstResponder()
        }
        return true
    }
    
}
