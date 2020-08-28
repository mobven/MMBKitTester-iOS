//
//  LocalizationViewController.swift
//  MMBKitTester
//
//  Created by Burak Yılmaz on 27.08.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import LocalizeIt

// swiftlint:disable all
class LocalizationViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var selectLanguageBttn: UIButton!
    
    @IBAction func selectLanguageBttn(_ sender: Any) {
        
        if #available(iOS 13, *) {
            let alert = UIAlertController(title: "Warning!", message: "You are redirected to settings. Are you sure?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{ (UIAlertAction)in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Language".localized , message: "please_select_an_language".localized, preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Türkçe", style: .default , handler:{ (UIAlertAction)in
                if LocalizeIt.shared().setAppLocalization("tr") == true {
                    self.languageChangeAlert()
                }
            }))
            
            alert.addAction(UIAlertAction(title: "English", style: .default , handler:{ (UIAlertAction)in
                if LocalizeIt.shared().setAppLocalization("en") == true {
                    self.languageChangeAlert()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            self.present(alert, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readDictionaryData()
        
        firstLabel.text = "app_security".localized
        secondLabel.text = "account_security".localized
    }
    
    func languageChangeAlert() {
        let alert = UIAlertController(title: "Warning!", message: "The application will restart. Are you sure?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:{ (UIAlertAction)in
            exit(0)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func readDictionaryData() {
        if let filePath = Bundle.main.path(forResource: "Test",
                                           ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            do {
                //swiftlint:disable force_cast
                let json: NSDictionary =
                    try JSONSerialization.jsonObject(
                        with: data as Data,
                        options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                //swiftlint:enable force_cast
                if let textGroups: [NSDictionary] = json["texts"] as? [NSDictionary] {
                    LocalizeIt.shared().set(textGroups)
                }
            } catch let error {
                print(error)
            }
        }
    }
    
}
// swiftlint:enable all
