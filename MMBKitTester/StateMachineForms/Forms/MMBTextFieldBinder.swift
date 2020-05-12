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
    
    typealias StateMachineFormType = MMBTextField
    
    init() {
        super.init(.text, inputType: .text)
        self.minimumHeight = 50
        self.viewType = StateMachineFormType.self
    }
    
    override var view: StateMachineForm.Binder.StateMachineViewType! {
        didSet {
            (view as? StateMachineFormType)?.delegate = self
        }
    }
    
    override var placeholder: String? {
        didSet {
            (view as? StateMachineFormType)?.placeholder = placeholder
        }
    }
    
    override var value: String? {
        didSet {
            (view as? StateMachineFormType)?.text = value
        }
    }
}

extension MMBTextFieldBinder: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        delegate?.formBinderValueChanged(view: textField, value: text)
        return true
    }
}
