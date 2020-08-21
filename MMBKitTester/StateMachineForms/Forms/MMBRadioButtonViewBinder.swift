//
//  MMBRadioButtonViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBRadioButtonViewBinder: StateMachineForm.Binder<MMBRadioButtonView> {
    
    public class var builder: Builder {
        return Builder(binder: Self.self, type: .radio, minimumHeight: 50)
    }
    
    override func binderDidLoad() {
        super.binderDidLoad()
        
        view.dataSource = self
        view.delegate = self
        view.reloadData()
    }
    
    override func isValidated() -> Bool {
        return validate(value: view.selectedRow)
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
        self.delegate?.formBinderValueChanged(binder: self, value: options?[row])
    }
}
