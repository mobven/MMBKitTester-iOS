//
//  JailbreakViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import AppSecurity

class JailbreakDetectionViewController: UIViewController {
    
    @IBOutlet private weak var terminationSwitch: UISwitch!
    @IBOutlet private weak var jailbreakStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        terminationSwitch.setOn(AppSecurity.shared().terminateAppForJailBrokenDevices, animated: false)
        if AppSecurity.shared().isDeviceJailBroken {
            jailbreakStateLabel.text = """
            Your device can access private system folders.
            
            It's not secure ⚠️
            """
        } else {
            jailbreakStateLabel.text = """
            Your device cannot access private system folders.
            
            It's secure 🎉
            """
        }
    }
    
    @IBAction private func terminateAppForJailBrokenDevices(_ sender: UISwitch) {
        AppSecurity.shared().terminateAppForJailBrokenDevices = sender.isOn
    }
    
}
