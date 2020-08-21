//
//  UIPickerTextFieldBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBUIComponents
import MBStateMachineForms

class UIDatePickerTextFieldBinder: StateMachineForm.Binder<UIDatePickerTextfield> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .select, inputType: .date, minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.datePicker.maximumDate = Date()
        view.placeholder = placeholder
        view.text = value
        view.setToolbar(title: label,
                        button: "Close",
                        target: self,
                        action: #selector(closePicker))
        view.dateFormat = rules?.dateFormat
        setPickerUI()
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: view.text)
    }
    
    @objc func closePicker() {
        view.resignFirstResponder()
        delegate?.formBinderValueChanged(binder: self, value: view.date)
    }
    
    func setPickerUI() {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.mmbBlue.cgColor
        view.layer.cornerRadius = 4
        view.borderStyle = .roundedRect
    }
}
