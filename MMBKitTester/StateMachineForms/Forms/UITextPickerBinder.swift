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

class UIPickerTextFieldBinder: StateMachineForm.Binder {
    public typealias StateMachineViewType = UIPickerTextfield
    
    /// Initializes binder with `UITextField` as input field.
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .select, minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.pickerDelegate = self
        (view as? StateMachineViewType)?.placeholder = placeholder
        (view as? StateMachineViewType)?.text = value
        (view as? StateMachineViewType)?.setToolbar(title: label,
                                                    button: "Close",
                                                    target: self,
                                                    action: #selector(closePicker))
        setPickerUI()
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(value: (view as? StateMachineViewType)?.selectedRow)
    }
    
    @objc private func closePicker() {
        view.resignFirstResponder()
        self.delegate?.formBinderValueChanged(binder: self,
                                              value: options?[(view as? StateMachineViewType)?.selectedRow ?? 0])
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
        self.delegate?.formBinderValueChanged(binder: self, value: options?[row])
    }
}
 
