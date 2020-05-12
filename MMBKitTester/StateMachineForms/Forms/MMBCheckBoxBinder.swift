//
//  MMBCheckBoxBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class MMBCheckBoxBinder: StateMachineForm.Binder {
    
    typealias StateMachineFormType = MMBCheckBoxView
    
    var isSelected: Bool {
        return (view as? StateMachineFormType)?.isSelected ?? false
    }

    init() {
        super.init(.checkbox)
        self.minimumHeight = 30
        self.viewType = StateMachineFormType.self
    }
    
    override var view: StateMachineForm.Binder.StateMachineViewType! {
        didSet {
            (view as? StateMachineFormType)?.delegate = self
        }
    }
    
    override var label: String? {
        didSet {
            (view as? StateMachineFormType)?.setTitle(label)
        }
    }
}

extension MMBCheckBoxBinder: MMBCheckBoxViewDelegate {
    func checkBox(_ checkBox: MMBCheckBoxView, isSelected: Bool) {
        self.delegate?.formBinderValueChanged(view: checkBox, value: checkBox)
    }
}
