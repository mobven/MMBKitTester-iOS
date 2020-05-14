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
    
    typealias StateMachineViewType = MMBCheckBoxView
    
    public class var builder: StateMachineForm.Binder.Builder {
         return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                        type: .checkbox, minimumHeight: 50)
     }
     
     required public init(view: UIView,
                          type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                          field: Forms.Field, delegate: FormBinderDelegate) {
         super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
         (view as? StateMachineViewType)?.delegate = self
         (view as? StateMachineViewType)?.setTitle(label)
         self.delegate?.formBinderValueChanged(binder: self, value: value)
     }

    var isSelected: Bool {
        return (view as? StateMachineViewType)?.isSelected ?? false
    }
}

extension MMBCheckBoxBinder: MMBCheckBoxViewDelegate {
    func checkBox(_ checkBox: MMBCheckBoxView, isSelected: Bool) {
        self.delegate?.formBinderValueChanged(binder: self, value: checkBox)
    }
}
