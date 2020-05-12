//
//  MMBRadioButtonViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class MMBRadioButtonViewBinder: StateMachineForm.Binder {
    
    typealias StateMachineFormType = MMBRadioButtonView
    
    init() {
        super.init(.radio)
        self.viewType = StateMachineFormType.self
    }
    
    override var view: StateMachineForm.Binder.StateMachineViewType! {
        didSet {
            (view as? StateMachineFormType)?.dataSource = self
            (view as? StateMachineFormType)?.delegate = self
        }
    }
    
    override var options: [Forms.Field.Option]? {
        didSet {
           (view as? StateMachineFormType)?.reloadData()
        }
    }
}

extension MMBRadioButtonViewBinder: MMBRadioButtonViewDataSource {
    func numberOfRadioButtons(_ view: MMBRadioButtonView) -> Int {
        return options?.count ?? 0
    }
    
    func radioButon(_ view: MMBRadioButtonView, radioButonAt row: Int) -> UIView {
        let view = MMBRadioButtonItem()
        view.configure(type: options?[row])
        return view
    }
}

extension MMBRadioButtonViewBinder: MMBRadioButtonViewDelegate {
    func radioButon(_ view: MMBRadioButtonView, didSelectAt row: Int) {
        self.delegate?.formBinderValueChanged(view: self.view, value: options?[row])
    }
}
