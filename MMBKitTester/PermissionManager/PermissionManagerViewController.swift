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
    
    var permissionTypeArray: [String] = [
        "bluetooth",
        "camera",
        "photos",
        "notification",
        "location",
        "calendar",
        "contacts",
        "microphone"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PermissionManagerViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Permission.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "PMTableViewCell", for: indexPath
            ) as? PMTableViewCell
            
            else {
                fatalError("Could not dequeue cell with id")
        }
        cell.set(permission: Permission.allCases[indexPath.row], delagate: self)
        return cell
    }
}
    // swiftlint:disable all
extension PermissionManagerViewController: PMTableViewCellDelegate {
    func permissionUpdated() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func userDidDenied() {
        let alert = UIAlertController(title: "Location access required to get your current location",
                                      message: "Please allow location access", preferredStyle: .alert)
          let settingsAction = UIAlertAction(title: "Settings", style: .default, handler: { action in

              // open the app permission in Settings app
              UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
          })

          let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)

          alert.addAction(settingsAction)
          alert.addAction(cancelAction)
        
          alert.preferredAction = settingsAction

          self.present(alert, animated: true, completion: nil)
    }
}
    // swiftlint:enable all
