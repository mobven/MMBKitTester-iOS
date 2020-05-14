//
//  AccountsViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class AccountsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var options: [Forms.Field.Option]?
    
    var optionSelected: ((Forms.Field.Option?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Close", style: .plain, target: self, action: #selector(dismissController)
        )
    }
    
    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AccountsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "AccountSelectionCell", for: indexPath
            ) as? AccountSelectionCell else { fatalError("Cell could not be initialized.") }
        cell.accountView.isUserInteractionEnabled = false
        cell.configure(data: options?[indexPath.row])
        return cell
    }
    
}

extension AccountsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.optionSelected?(options?[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}
