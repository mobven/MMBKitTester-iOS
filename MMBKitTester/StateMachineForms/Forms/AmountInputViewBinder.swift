//
//  AmountInputViewBinder.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 20.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBUIComponents
import MBStateMachineForms

class AmountInputViewBinder: StateMachineForm.Binder<AmountInputView> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .text,
                       inputType: .other("amount"), minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.currencies = ["USD", "EUR"]
        view.textfield.placeholder = placeholder
        view.textfield.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: view.textfield.text)
    }
    
}
