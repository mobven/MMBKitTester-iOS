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
import OneLink
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MMBKit.setup(with: [AppSecurity.shared, AccountSecurity.shared, OneLink.shared])
        
        FirebaseApp.configure()
        
        // Register for push notifications
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in }
        )
        application.registerForRemoteNotifications()
        
        // Handle universal links if application started with one
        if let url = launchOptions?[.url] as? URL {
            _ = self.application(application, open: url)
        }
        
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
    
    /// Handle universal links
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if let link = AppLink(url: url) {
            OneLink.shared.present(oneLink: link, ignoreLinkState: User.shared.isLoggedIn)
            return true
        }
        // Continue for your app's normal flow.
        return false
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    /// Shows push notification, even if its in foreground.
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void) {
        /// Pass url parameter from the payload to `OneLink` instance.
        if let url = response.notification.request.content.userInfo["gcm.notification.data"] as? String,
            let link = AppLink(url: url) {
            OneLink.shared.present(oneLink: link, ignoreLinkState: User.shared.isLoggedIn)
        }
        completionHandler()
    }
    
}
