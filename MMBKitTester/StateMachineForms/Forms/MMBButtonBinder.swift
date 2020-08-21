//
//  MMBButtonBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBButtonBinder: StateMachineForm.Binder<MMBButton> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .action, minimumHeight: 45)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.setTitle(value, for: .normal)
        view.addTarget(self, action: #selector(actionClicked), for: .touchUpInside)
    }
    
    @objc func actionClicked() {
        if let action = actionType {
            self.delegate?.formBinderAction(action)
        }
    }
}
