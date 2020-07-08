//
//  TimedCacheViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 31.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAccountSecurity

class TimedCacheViewController: UIViewController {
    
    @IBOutlet private weak var valueTextfield: UITextField!
    @IBOutlet private weak var expirationTextfield: UITextField!
    
    private let timedCache = TimedCache<String, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func save() {
        var expiration: Expiration = .never
        if let expirationDuration = Int(expirationTextfield.text!) {
            expiration = .in(seconds: TimeInterval(expirationDuration))
        }
        if let text = valueTextfield.text, !text.isEmpty {
            timedCache.setObject(text, forKey: "string_value", expiration: expiration)
            (UIApplication.shared.delegate as? AppDelegate)?.observeCacheExpiration()
        } else {
            timedCache.removeObject(forKey: "string_value")
        }
    }
    
}

extension TimedCacheViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == valueTextfield {
            expirationTextfield.becomeFirstResponder()
        } else if textField == expirationTextfield {
            expirationTextfield.resignFirstResponder()
        }
        return true
    }
    
}
