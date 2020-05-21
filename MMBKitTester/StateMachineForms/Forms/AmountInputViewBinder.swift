//
//  AmountInputViewBinder.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 20.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents
import StateMachineForms

class AmountInputViewBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = AmountInputView
    
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .text, inputType: .other("amount"), minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.currencies = ["USD", "EUR"]
        (view as? StateMachineViewType)?.textfield.placeholder = placeholder
        (view as? StateMachineViewType)?.textfield.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(text: (view as? StateMachineViewType)?.textfield.text)
    }
    
}
