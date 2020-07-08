//
//  BiometricsViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 31.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAccountSecurity
import LocalAuthentication

class BiometricsViewController: UIViewController {
    
    @IBOutlet private weak var secretKeyLabel: UILabel!
    @IBOutlet private weak var clearKeyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticate()
    }
    
    private func authenticate() {
        AccountSecurity.shared().authWithBiometrics(
            forAccount: "myAccountId",
            reason: "Authenticate to log in easily.") { [ weak self ] (secretKey, _) in
                DispatchQueue.main.async {
                    if let secretKey = secretKey {
                        self?.secretKeyLabel.text = """
                        Secret Key:
                        \(secretKey)
                        """
                        self?.clearKeyButton.isHidden = false
                    }
                }
        }
    }
    
    @IBAction private func clearKey() {
        AccountSecurity.shared().clearBiometricsSecretKey()
        secretKeyLabel.text = ""
        clearKeyButton.isHidden = true
    }
    
}
