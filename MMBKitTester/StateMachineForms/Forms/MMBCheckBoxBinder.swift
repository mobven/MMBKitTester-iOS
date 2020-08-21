//
//  MMBCheckBoxBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBCheckBoxBinder: StateMachineForm.Binder<MMBCheckBoxView> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .checkbox, minimumHeight: 28)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.delegate = self
        view.setTitle(label)
        self.delegate?.formBinderValueChanged(binder: self, value: value)
    }
    
    override func isValidated() -> Bool {
        return validate(bool: view.isSelected)
    }
    
}

extension MMBCheckBoxBinder: MMBCheckBoxViewDelegate {
    func checkBox(_ checkBox: MMBCheckBoxView, isSelected: Bool) {
        self.delegate?.formBinderValueChanged(binder: self, value: checkBox)
    }
}
