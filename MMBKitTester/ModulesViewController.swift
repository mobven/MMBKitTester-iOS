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
        .init(name: "App Security", identifier: "AppSecurityViewController"),
        .init(name: "Account Security", identifier: "AccountSecurityViewController"),
        .init(name: "Secure Network", identifier: ""),
        .init(name: "UI Components", identifier: "UIComponentsViewController"),
        .init(name: "State Machine Forms", identifier: ""),
        .init(name: "Permission Manager", identifier: ""),
        .init(name: "Pin Locator", identifier: ""),
        .init(name: "One Link", identifier: "OneLinkViewController"),
        .init(name: "Error Kit", identifier: "")
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
