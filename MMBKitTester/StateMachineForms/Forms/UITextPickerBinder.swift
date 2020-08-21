//
//  UITextPickerBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBUIComponents
import MBStateMachineForms

class UIPickerTextFieldBinder: StateMachineForm.Binder<UIPickerTextfield> {
    
    /// Initializes binder with `UITextField` as input field.
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .select, minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.pickerDelegate = self
        view.placeholder = placeholder
        view.text = value
        view.setToolbar(title: label,
                        button: "Close",
                        target: self,
                        action: #selector(closePicker))
        setPickerUI()
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(value: view.selectedRow)
    }
    
    @objc private func closePicker() {
        view.resignFirstResponder()
        self.delegate?.formBinderValueChanged(binder: self,
                                              value: options?[view.selectedRow ?? 0])
    }
    
    func setPickerUI() {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.mmbBlue.cgColor
        view.layer.cornerRadius = 4
        view.borderStyle = .roundedRect
    }
}

extension UIPickerTextFieldBinder: UIPickerTextfieldDelegate {
    func pickerTextfieldNumberOfRows(_ pickerTextfield: UIPickerTextfield) -> Int {
        return options?.count ?? 0
    }
    
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, titleForRow row: Int) -> String? {
        return options?[row].name
    }
    
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, didSelectRow row: Int) {
        self.delegate?.formBinderValueChanged(binder: self, value: options?[row])
    }
}

