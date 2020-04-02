//
//  AccountSecurityViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import AccountSecurity

class AccountSecurityViewController: UITableViewController {
    
    private var functions: [Module] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AccountSecurity.shared.canAuthWithBiometrics {
            functions.append(.init(name: "Login With Biometrics", identifier: "BiometricsViewController"))
        }
        functions.append(.init(name: "Timed Cache", identifier: "TimedCacheViewController"))
    }
    
}

extension AccountSecurityViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModuleCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = functions[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewController = storyboard?.instantiateViewController(
            withIdentifier: functions[indexPath.row].identifier) else {
                return
        }
        viewController.title = functions[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
