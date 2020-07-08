//
//  CustomPopupsViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 01.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBUIComponents

class CustomPopupsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alert.appearance.titleColor = .blue
        Alert.appearance.titleFont = UIFont.boldSystemFont(ofSize: 22)
        Alert.appearance.messageColor = .darkGray
        Alert.appearance.messageFont = UIFont.systemFont(ofSize: 17)
        Alert.appearance.defaultButtonTextColor = .white
        Alert.appearance.defaultButtonBackgroundColor = .orange
        Alert.appearance.defaultButtonFont = UIFont.boldSystemFont(ofSize: 17)
        Alert.appearance.destructiveButtonTextColor = .white
        Alert.appearance.destructiveButtonBackgroundColor = .lightGray
        Alert.appearance.destructiveButtonFont = UIFont.boldSystemFont(ofSize: 17)
        Alert.appearance.customViewContentInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    @IBAction func presentClassicAlert() {
        let alert = Alert(title: "Warning", message: "It's really easy to show alert, isn't it?!")
        alert.addAction(Alert.Button(title: "Apply", type: .default, action: { _ in
            print("Apply")
        }))
        alert.addAction(Alert.Button(title: "Close", type: .destructive))
        alert.present(over: self)
    }
    
    @IBAction func presentCustomAlert() {
        let alert = Alert(contentView: CustomAlert.instance(title: "Summary", description: "Lorem ipsum alert."))
        alert.addAction(Alert.Button(title: "Apply", type: .default, action: { _ in
            print("Apply")
        }))
        alert.addAction(Alert.Button(title: "Close", type: .destructive))
        alert.present(over: self)
    }
    
    @IBAction func presentCustomKeyValueListAlert() {
        let alert = Alert(contentView: CustomKeyValueListAlert.instance(title: "Summary"))
        alert.addAction(Alert.Button(title: "Apply", type: .default, action: { _ in
            print("Apply")
        }))
        alert.addAction(Alert.Button(title: "Close", type: .destructive))
        alert.present(over: self)
    }
    
}
