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
    
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .select, inputType: .date, minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.datePicker.maximumDate = Date()
        (view as? StateMachineViewType)?.placeholder = placeholder
        (view as? StateMachineViewType)?.text = value
        (view as? StateMachineViewType)?.setToolbar(title: label,
                                                    button: "Close",
                                                    target: self,
                                                    action: #selector(closePicker))
        (view as? StateMachineViewType)?.dateFormat = rules?.dateFormat
        setPickerUI()
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: (view as? StateMachineViewType)?.text)
    }
    
    @objc func closePicker() {
        view.resignFirstResponder()
        delegate?.formBinderValueChanged(binder: self, value: (view as? StateMachineViewType)?.date)
    }
    
    func setPickerUI() {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.mmbBlue.cgColor
        view.layer.cornerRadius = 4
        (view as? StateMachineViewType)?.borderStyle = .roundedRect
    }
}
 
