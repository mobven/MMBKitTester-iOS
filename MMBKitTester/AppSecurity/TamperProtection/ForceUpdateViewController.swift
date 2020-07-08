//
//  ForceUpdateViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAppSecurity

class ForceUpdateViewController: UIViewController {
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForForceUpdate()
    }
    
    private func checkForForceUpdate() {
        AppSecurity.shared().checkForceUpdate(showAlertIfNeeded: true) { [ weak self ] (response, error) in
            if response == nil && error == nil {
                // application is up-to-date
                self?.infoLabel.isHidden = false
            } else if let error = error {
                // error occured while checking for force update
                self?.infoLabel.isHidden = true
                self?.showErrorAlert(error: error)
            }
        }
    }
    
    private func showErrorAlert(error: Error) {
        let message = "Error occured while loading: \(error.localizedDescription)"
        let alert = UIAlertController(title: "Error",
                                      message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Cancel", style: .cancel) { [ weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        )
        alert.addAction(
            UIAlertAction(title: "Reload", style: .default) { [ weak self] _ in
                self?.checkForForceUpdate()
            }
        )
        present(alert, animated: true, completion: nil)
    }
    
}
