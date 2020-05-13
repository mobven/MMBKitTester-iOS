//
//  StateMachineFormsViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents
import StateMachineForms

class StateMachineFormsViewController: UIViewController {

    @IBOutlet weak var stateMachineForm: StateMachineForm!
    
    var service = StateMachineFormsService(className: "Forms")
    
    var pageIndex = 0
    var storedFormdata: [FormData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stateMachineForm.setInitialData(storedFormdata)
        
        stateMachineForm.register(binder: MMBTextFieldBinder())
        stateMachineForm.register(binder: UIDatePickerTextFieldBinder())
        stateMachineForm.register(binder: UIPickerTextFieldBinder())
        stateMachineForm.register(binder: MMBCheckBoxBinder())
        stateMachineForm.register(binder: MMBButtonBinder())
        stateMachineForm.register(binder: MMBRadioButtonViewBinder())
        
        stateMachineForm.delegate = self
        stateMachineForm.itemInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        self.getForms()
    }
    
    func getForms() {
        self.service.getFormsClass { [weak self] (form, error) in
            guard let self = self else { return }
            if error == nil, let form = form?[self.pageIndex] {
                self.stateMachineForm.feed(form)
            }
        }
    }
    
    private var formData: Forms? {
        guard let path = Bundle.main.url(forResource: "forms", withExtension: "json") else { return nil }
        guard let jsonData = try? Data(contentsOf: path, options: .mappedIfSafe) else { return nil }
        return try? JSONDecoder().decode(Forms.self, from: jsonData)
    }
}

extension StateMachineFormsViewController: StateMachineFormDelegate {
    func stateMachineFormAction(with actionType: Forms.Field.ActionType, data: [FormData]) {
        switch actionType {
        case .back:
            self.navigationController?.popViewController(animated: true)
        case .next:
            if formData?.forms?.count == pageIndex {
                break
            } else {
                guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "StateMachineFormsViewController") as? StateMachineFormsViewController else { return }
                viewController.pageIndex = pageIndex + 1
                viewController.storedFormdata = data
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        case .request:
            break
        }
        
        print(data)
    }
}
