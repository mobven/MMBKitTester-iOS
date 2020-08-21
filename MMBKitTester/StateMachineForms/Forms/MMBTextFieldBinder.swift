//
//  MMBTextFieldBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBTextFieldBinder: StateMachineForm.Binder<MMBTextField> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .text, minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.delegate = self
        if self.inputType == .password {
            view.isSecureTextEntry = true
        }
        view.placeholder = placeholder
        view.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: view.text)
    }
}

extension MMBTextFieldBinder: UITextFieldDelegate {
    @nonobjc public func textField(_ textField: UITextField,
                                   shouldChangeCharactersIn range: NSRange,
                                   replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        delegate?.formBinderValueChanged(binder: self, value: text)
        return true
    }
}
