//
//  SecureNetworkViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class SecureNetworkViewController: UITableViewController {
    
    private let modules: [Module] = [
        .init(name: "OAUTH", identifier: "OAUTHViewController"),
        .init(name: "Cryptography", identifier: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SecureNetworkViewController {
    
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
