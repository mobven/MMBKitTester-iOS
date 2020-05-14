//
//  MMBTextFieldBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class MMBTextFieldBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = MMBTextField

    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .text, minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.delegate = self
        if inputType == .password {
            (view as? StateMachineViewType)?.isSecureTextEntry = true
        }
        (view as? StateMachineViewType)?.placeholder = placeholder
        (view as? StateMachineViewType)?.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: (view as? StateMachineViewType)?.text)
    }
}

extension MMBTextFieldBinder: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        delegate?.formBinderValueChanged(binder: self, value: text)
        return true
    }
}
