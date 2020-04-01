//
//  AppDelegate.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MMBKit
import AppSecurity
import AccountSecurity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MMBKit.setup(with: [AppSecurity.shared, AccountSecurity.shared])
        
        return true
    }
    
    func observeCacheExpiration() {
        NotificationCenter.default.addObserver(self, selector: #selector(cachedItemDidExpire(_:)),
                                               name: .cachedItemDidExpire, object: nil)
    }
    
    @objc private func cachedItemDidExpire(_ notification: Notification) {
        let releatedItem = notification.userInfo as? [String: String]
        if let value = releatedItem?["string_value"] {
            showExpiredAlert(value: value)
        }
    }
    
    private func showExpiredAlert(value: String) {
        let title = "Timed Cache Expired"
        let message = "Item expired with value: \"\(value)\""
        window?.rootViewController?.showAlert(title: title, message: message, doneButton: "Done")
    }
    
}
