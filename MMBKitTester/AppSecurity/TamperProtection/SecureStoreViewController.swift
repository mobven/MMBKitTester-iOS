//
//  SecureStoreViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBAppSecurity

class SecureStoreViewController: UIViewController {
    
    @IBOutlet private weak var contentView: UIView!
    
    private var writeViewController: UIViewController?
    private var readViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeViewController = children.first as? SecureStoreWriteViewController
        let key = "dS84G18VdHRgVrlKcucD910OYumPqjM7"
        let initialVector = "f1ede36fa3645589"
        AppSecurity.shared().secureKeyValueOptions = (key: key, iv: initialVector)
    }
    
    @IBAction private func changeContent(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if writeViewController == nil {
                writeViewController = storyboard?.instantiateViewController(
                    withIdentifier: "SecureStoreWriteViewController") as? SecureStoreWriteViewController
            }
            removeFromContent(viewController: readViewController)
            changeContent(to: writeViewController!)
        } else {
            if readViewController == nil {
                readViewController = storyboard?.instantiateViewController(
                    withIdentifier: "SecureStoreReadViewController") as? SecureStoreReadViewController
            }
            removeFromContent(viewController: writeViewController)
            changeContent(to: readViewController!)
        }
    }
    
    fileprivate func changeContent(to viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = CGRect(
            origin: contentView.bounds.origin,
            size: CGSize(width: contentView.bounds.width,
                         height: contentView.bounds.height)
        )
        contentView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    fileprivate func removeFromContent(viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        view.endEditing(false)
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
}
