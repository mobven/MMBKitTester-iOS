//
//  MMBTextViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 15.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBTextViewBinder: StateMachineForm.Binder<MMBTextView> {
    
    class var builder: Builder {
        return Builder(binder: Self.self, type: .textarea, inputType: .text, minimumHeight: 120)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.delegate = self
        
        view.text = value
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    public override func isValidated() -> Bool {
        return validate(text: view.text)
    }
    
}

extension MMBTextViewBinder: UITextViewDelegate {
    
    @nonobjc public func textViewDidChange(_ textView: UITextView) {
        delegate?.formBinderValueChanged(binder: self, value: textView.text)
    }
    
}
