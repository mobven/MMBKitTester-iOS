//
//  MMBButtonBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class MMBButtonBinder: StateMachineForm.Binder {
    
    typealias StateMachineFormType = MMBButton
    
    init() {
        super.init(.action)
        self.minimumHeight = 45
        self.viewType = StateMachineFormType.self
    }
    
    override var value: String? {
        didSet {
            (view as? StateMachineFormType)?.setTitle(value, for: .normal)
        }
    }
    
}
