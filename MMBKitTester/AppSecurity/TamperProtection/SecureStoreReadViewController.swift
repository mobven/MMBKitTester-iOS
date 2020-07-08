//
//  SecureStoreReadViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAppSecurity

class SecureStoreReadViewController: BaseTypeViewController {
    
    @IBOutlet private weak var keyTextfield: UITextField!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func read() {
        let type = pickerView.selectedRow(inComponent: 0)
        let key = keyTextfield.text!
        switch type {
        case 0:
            let value = UserDefaults.standard.secureBool(forKey: key)
            valueLabel.text = "Saved boolean value is \"\(value)\""
        case 1:
            let value = UserDefaults.standard.secureInteger(forKey: key)
            valueLabel.text = "Saved integer value is \"\(value)\""
        case 2:
            let value = UserDefaults.standard.secureFloat(forKey: key)
            valueLabel.text = "Saved float value is \"\(value)\""
        case 3:
            let value = UserDefaults.standard.secureDouble(forKey: key)
            valueLabel.text = "Saved double value is \"\(value)\""
        case 4:
            let value = UserDefaults.standard.secureString(forKey: key)
            valueLabel.text = "Saved string value is \"\(value ?? "nil")\""
        case 5:
            let value = UserDefaults.standard.secureURL(forKey: key)
            valueLabel.text = "Saved integer value is \"\(value?.absoluteString ?? "nil")\""
        default: return
        }
    }
    
}

extension SecureStoreReadViewController {
    
    override func pickerView(_ pickerView: UIPickerView,
                             didSelectRow row: Int, inComponent component: Int) {
        super.pickerView(pickerView, didSelectRow: row, inComponent: component)
        valueLabel.text = ""
    }
    
}

extension SecureStoreReadViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == keyTextfield {
            keyTextfield.resignFirstResponder()
        }
        return true
    }
    
}
