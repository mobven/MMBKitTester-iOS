//
//  MMBRadioButtonViewBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

class MMBRadioButtonViewBinder: StateMachineForm.Binder {
    
    typealias StateMachineViewType = MMBRadioButtonView
    
    public class var builder: StateMachineForm.Binder.Builder {
        return Builder(binder: Self.self, viewType: StateMachineViewType.self,
                       type: .radio, minimumHeight: 50)
    }
    
    required public init(view: UIView,
                         type: Forms.Field.ViewType, inputType: Forms.Field.InputType? = nil,
                         field: Forms.Field, delegate: FormBinderDelegate) {
        super.init(view: view, type: type, inputType: inputType, field: field, delegate: delegate)
        (view as? StateMachineViewType)?.dataSource = self
        (view as? StateMachineViewType)?.delegate = self
        (view as? StateMachineViewType)?.reloadData()
    }
    
    override func isValidated() -> Bool {
        return validate(value: (view as? StateMachineViewType)?.selectedRow)
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
