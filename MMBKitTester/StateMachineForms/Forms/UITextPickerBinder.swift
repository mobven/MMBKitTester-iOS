//
//  UITextPickerBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents
import StateMachineForms

class UIPickerTextFieldBinder: StateMachineForm.Binder {
    public typealias StateMachineViewType = UIPickerTextfield
    
    /// Initializes binder with `UITextField` as input field.
    public init() {
        super.init(.select)
        self.minimumHeight = 50
        self.viewType = StateMachineViewType.self
    }
    
    override var view: StateMachineForm.Binder.StateMachineViewType! {
        didSet {
            (view as? StateMachineViewType)?.pickerDelegate = self
            self.setPickerUI()
        }
    }
    
    public override var placeholder: String? {
        didSet {
            (view as? StateMachineViewType)?.placeholder = placeholder
        }
    }
    
    public override var value: String? {
        didSet {
            (view as? StateMachineViewType)?.text = value
        }
    }
    
    override var label: String? {
        didSet {
            (view as? StateMachineViewType)?.setToolbar(title: label, button: "Close", target: self, action: #selector(closePicker))
        }
    }
    
    @objc private func closePicker() {
        view.resignFirstResponder()
        self.delegate?.formBinderValueChanged(view: view, value: options?[(view as? StateMachineViewType)?.selectedRow ?? 0])
    }
    
    func setPickerUI() {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.mmbBlue.cgColor
        view.layer.cornerRadius = 4
        (view as? StateMachineViewType)?.borderStyle = .roundedRect
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
        self.delegate?.formBinderValueChanged(view: pickerTextfield, value: options?[row])
    }
}

