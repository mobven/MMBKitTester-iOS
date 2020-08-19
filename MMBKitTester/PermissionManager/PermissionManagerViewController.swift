//
//  PermissionManagerViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 19.08.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import PermissionManager

class PermissionManagerViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension PermissionManagerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // Permission.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "PMTableViewCell", for: indexPath
            ) as? PMTableViewCell else {
                fatalError("Could not dequeue cell with id")
        }
        cell.set()
        return cell
    }
    
}
