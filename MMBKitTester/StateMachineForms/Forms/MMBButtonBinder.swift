//
//  MMBButtonBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBButtonBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = MMBButton
    
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .action, minimumHeight: 45)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.setTitle(value, for: .normal)
        (view as? StateMachineViewType)?.addTarget(self, action: #selector(actionClicked), for: .touchUpInside)
    }
    
    @objc func actionClicked() {
        if let action = actionType {
            self.delegate?.formBinderAction(action)
        }
    }
}
