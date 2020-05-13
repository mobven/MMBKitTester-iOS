//
//  AccountViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class AccountViewBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = AccountView
        
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .custom, inputType: .other("account"), minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.delegate = self
        (view as? StateMachineViewType)?.setTitleLabel(label)
        (view as? StateMachineViewType)?.setDescriptionLabel(value)
    }
    

    func configure(option: Forms.Field.Option?) {
        (view as? StateMachineViewType)?.configure(option: option)
        self.delegate?.formBinderValueChanged(binder: self, value: option)
    }
}

extension AccountViewBinder: AccountViewDelegate {
    func accountViewDidTap() {
        self.delegate?.formBinderNavigate(binder: self)
    }
}
