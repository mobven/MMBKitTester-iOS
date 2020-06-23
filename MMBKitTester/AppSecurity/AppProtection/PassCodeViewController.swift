//
//  PassCodeViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import AppSecurity

class PassCodeViewController: UIViewController {
    
    @IBOutlet private weak var passcodeStateLabel: UILabel!
    @IBOutlet private weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDeviceOwnerAuthenticationStatus()
        NotificationCenter.default.addObserver(self, selector: #selector(setDeviceOwnerAuthenticationStatus),
                                               name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc private func setDeviceOwnerAuthenticationStatus() {
        if AppSecurity.shared().hasDeviceOwnerAuthentication() {
            passcodeStateLabel.text = """
            Your device has owner authentication enabled.
            
            It's secure 🎉
            """
        } else {
            passcodeStateLabel.text = """
            Your device has no owner authentication enabled.
            
            It's not secure ⚠️
            """
        }
    }
    
    @IBAction private func goToSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
