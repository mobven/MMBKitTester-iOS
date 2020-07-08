//
//  MMBTextViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 15.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

public class MMBTextViewBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = MMBTextView
    
    class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .textarea, inputType: .text, minimumHeight: 120)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType,
                         inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field,
                         delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        
        (view as? StateMachineViewType)?.delegate = self
        
        (view as? StateMachineViewType)?.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    public override func isValidated() -> Bool {
        return validate(text: (view as? StateMachineViewType)?.text)
    }
    
}

extension MMBTextViewBinder: UITextViewDelegate {
    
    @nonobjc public func textViewDidChange(_ textView: UITextView) {
        delegate?.formBinderValueChanged(binder: self, value: textView.text)
    }
    
}
