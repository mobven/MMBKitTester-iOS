//
//  AppSecurityViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class AppSecurityViewController: UITableViewController {
    
    private var sections: [ModuleSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appProtection = ModuleSection(name: "App Protection", modules: [])
        appProtection.modules.append(.init(name: "Prevent Snapshots", identifier: "PreventSnapshotsViewController"))
        appProtection.modules.append(.init(name: "Jailbreak Detection", identifier: "JailbreakDetectionViewController"))
        appProtection.modules.append(.init(name: "Disable Copy/Paste", identifier: "SecureTextfieldViewController"))
        if #available(iOS 11.0, *) {
            appProtection.modules.append(.init(name: "Prevent Screen Recording and AirPlay Mirroring",
                                               identifier: "PreventRecordingViewController"))
        }
        appProtection.modules.append(.init(name: "PassCode Detect", identifier: "PassCodeViewController"))
        sections.append(appProtection)
        sections.append(.init(name: "Tamper Protection", modules: [
            .init(name: "Secure Store", identifier: "SecureStoreViewController"),
            .init(name: "Force Update", identifier: "ForceUpdateViewController")
        ]))
    }
    
}

extension AppSecurityViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].modules.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModuleCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = sections[indexPath.section].modules[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewController = storyboard?.instantiateViewController(
            withIdentifier: sections[indexPath.section].modules[indexPath.row].identifier) else {
                return
        }
        viewController.title = sections[indexPath.section].modules[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
}
