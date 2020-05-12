//
//  UIPickerTextFieldBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents
import StateMachineForms

class UIDatePickerTextFieldBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = UIDatePickerTextfield
    
    init() {
        super.init(.select, inputType: .date)
        self.minimumHeight = 50
        self.viewType = StateMachineViewType.self
    }
    
    override var view: StateMachineForm.Binder.StateMachineViewType! {
        didSet {
            (view as? StateMachineViewType)?.datePicker.maximumDate = Date()
            self.setPickerUI()
        }
    }
    
    override var placeholder: String?{
        didSet {
            (view as? StateMachineViewType)?.placeholder = placeholder
        }
    }
    
    override var value: String? {
        didSet {
            (view as? StateMachineViewType)?.text = value
        }
    }
    
    override var label: String? {
        didSet {
            (view as? StateMachineViewType)?.setToolbar(title: label, button: "Close", target: self, action: #selector(closePicker))
        }
    }
    
    override var rules: Forms.Field.Rules? {
        didSet {
            (view as? StateMachineViewType)?.dateFormat = rules?.dateFormat
        }
    }
    
    @objc func closePicker() {
        view.resignFirstResponder()
        delegate?.formBinderValueChanged(view: view, value: (view as? StateMachineViewType)?.date)
    }
    
    func setPickerUI() {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.mmbBlue.cgColor
        view.layer.cornerRadius = 4
        (view as? StateMachineViewType)?.borderStyle = .roundedRect
    }
}

