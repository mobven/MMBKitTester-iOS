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
        
        stateMachineForm.register(builder: MMBTextFieldBinder.builder)
        stateMachineForm.register(builder: UIDatePickerTextFieldBinder.builder)
        stateMachineForm.register(builder: UIPickerTextFieldBinder.builder)
        stateMachineForm.register(builder: MMBCheckBoxBinder.builder)
        stateMachineForm.register(builder: MMBButtonBinder.builder)
        stateMachineForm.register(builder: MMBRadioButtonViewBinder.builder)
        stateMachineForm.register(builder: AccountViewBinder.builder)
        
        stateMachineForm.delegate = self
        stateMachineForm.itemInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        
        self.getForms(onParse: true)
    }
    
    func getForms(onParse: Bool) {
        if onParse {
            self.service.getFormsClass { [weak self] (form, error) in
                guard let self = self else { return }
                if error == nil, let form = form?[self.pageIndex] {
                    self.stateMachineForm.feed(form)
                }
            }
        } else {
            if let form = formData?.forms?[pageIndex] {
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
    func stateMachineForm(_ stateMachineForm: StateMachineForm, takeAction actionType: Forms.Field.ActionType, data: [FormData]) {
        switch actionType {
        case .back:
            self.navigationController?.popViewController(animated: true)
        case .next:
            if formData?.forms?.count == (pageIndex + 1) {
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
    
    func stateMachineForm(_ stateMachineForm: StateMachineForm, navigateBinder binder: StateMachineForm.Binder) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "AccountsViewController") as? AccountsViewController else { return }
        viewController.options = binder.options
        
        viewController.optionSelected = { option in
            (binder as? AccountViewBinder)?.configure(option: option)
        }
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }
    
    func stateMachineForm(_ stateMachineForm: StateMachineForm,
                          bindersCouldNotBeValidated invalidBinders: [StateMachineForm.Binder]) {
        let errorMessages: [String] = invalidBinders.map({ $0.errorMessage ?? "" })
        let message = errorMessages.joined(separator: ",\n")
        let alert = Alert(title: "Invalid inputs", message: "\(message)")
        alert.addAction(.init(title: "Okay", type: .default))
        alert.present(over: self)
        for binder in invalidBinders {
            print("Invalid binder: \(binder.identifier). Error message: \(binder.errorMessage ?? "")")
        }
        
    }
}
