//
//  AccountViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class AccountViewBinder: StateMachineForm.Binder<AccountView> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .custom,
                       inputType: .other("account"), minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.delegate = self
        view.setTitleLabel(label)
        view.setDescriptionLabel(value)
    }
    
    func configure(option: Forms.Field.Option?) {
        view.configure(option: option)
        self.delegate?.formBinderValueChanged(binder: self, value: option)
    }
}

extension AccountViewBinder: AccountViewDelegate {
    func accountViewDidTap() {
        self.delegate?.formBinderNavigate(binder: self)
    }
}
