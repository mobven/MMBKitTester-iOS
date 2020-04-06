//
//  OneLinkViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 05.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import FirebaseInstanceID
import OneLink

class OneLinkViewController: UIViewController {
    
    @IBOutlet weak var urlTextfield: UITextField!
    @IBOutlet weak var loginStatusSwitch: UISwitch!
    
    private var firebaseInstanceId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OneLink.shared.delegate = self
        
        urlTextfield.text = "https://bkt.com/cards/?id=1533"
        loginStatusSwitch.isOn = User.shared.isLoggedIn
        
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
            } else if let result = result {
                self.firebaseInstanceId  = result.token
            }
        }
    }
    
    @IBAction func presentPendingLinks() {
        self.view.endEditing(false)
        OneLink.shared.presentPendingLinks()
    }
    
    @IBAction func sendDirectPushNotification() {
        self.view.endEditing(false)
        guard let firebaseInstanceId = firebaseInstanceId,
            let urlString = urlTextfield.text else { return }
        FCMCurl.sendNotification(firebaseInstanceId: firebaseInstanceId, payloadUrl: urlString)
    }
    
    @IBAction func changeLoginStatus() {
        User.shared.isLoggedIn = !User.shared.isLoggedIn
    }
    
}

extension OneLinkViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(false)
    }
    
}

extension OneLinkViewController: OneLinkDelegate {
    
    func oneLinkAllLinksCompleted() {
        showAlert(title: "OneLink 🌟",
                  message: "All links have been presented successfully.",
                  doneButton: "Done")
    }
    
}
