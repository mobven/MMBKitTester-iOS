//
//  UIComponentsViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 15.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class UIComponentsViewController: UITableViewController {
    
    private var sections: [ModuleSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var components = ModuleSection(name: "Components", modules: [])
        components.modules.append(.init(name: "Key-Value Label", identifier: "KVLabelViewController"))
        components.modules.append(.init(name: "Key-Value List", identifier: "KVListViewController"))
        components.modules.append(.init(name: "Amount-Input View", identifier: "AmountInputViewController"))
        components.modules.append(.init(name: "Custom Navigation View", identifier: ""))
        components.modules.append(.init(name: "Custom Popups", identifier: "CustomPopupsViewController"))
        components.modules.append(.init(name: "Add-On Features", identifier: "AddOnFeaturesViewController"))
        sections.append(components)
        sections.append(.init(name: "Custom Dashboard", modules: [
            .init(name: "Custom Dashboard", identifier: "")
        ]))
    }
    
}

extension UIComponentsViewController {
    
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
        let module = sections[indexPath.section].modules[indexPath.row]
        guard !module.identifier.isEmpty,
            let viewController = storyboard?.instantiateViewController(
                withIdentifier: module.identifier) else {
                    showAlert(title: "🌟", message: "Development in Progress", doneButton: "Done")
                    return
        }
        viewController.title = module.name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
}
