//
//  ModulesViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class ModulesViewController: UITableViewController {
    
    private let modules: [Module] = [
        .init(name: "app_security".localized, identifier: "AppSecurityViewController"),
        .init(name: "account_security".localized, identifier: "AccountSecurityViewController"),
        .init(name: "secure_network".localized, identifier: "SecureNetworkViewController"),
        .init(name: "ui_components".localized, identifier: "UIComponentsViewController"),
        .init(name: "state_machine_forms".localized, identifier: "StateMachineFormsViewController"),
        .init(name: "permission_manager".localized, identifier: ""),
        .init(name: "pin_locator".localized, identifier: "PinLocatorViewController"),
        .init(name: "one_link".localized, identifier: "OneLinkViewController"),
        .init(name: "error_kit".localized, identifier: "ErrorKitViewController"),
        .init(name: "permission_manager".localized, identifier: "PermissionManagerViewController"),
        .init(name: "localize_it".localized, identifier: "LocalizationViewController")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ModulesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModuleCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = modules[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let identifier = modules[indexPath.row].identifier
        guard !identifier.isEmpty,
            let viewController = storyboard?.instantiateViewController(
                withIdentifier: identifier) else {
                    showAlert(title: "🌟", message: "Development in Progress", doneButton: "Done")
                    return
        }
        viewController.title = modules[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
