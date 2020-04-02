//
//  BaseTypeViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 30.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class BaseTypeViewController: UIViewController {
    
    @IBOutlet private weak var typeTextfield: UITextField!
    
    var pickerView = UIPickerView()
    var pickerItems: [SecureStoreType] = [
        .init(name: "Bool", placeholder: "YES/NO"),
        .init(name: "Int", placeholder: "100"),
        .init(name: "Float", placeholder: "10.5"),
        .init(name: "Double", placeholder: "12.23"),
        .init(name: "String", placeholder: "This app rocks! 🎉"),
        .init(name: "URL", placeholder: "https://mobven.com/")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        typeTextfield.inputView = pickerView
        
        pickerView.selectRow(0, inComponent: 0, animated: false)
        closePicker()
        
        let toolbar = UIToolbar()
        
        toolbar.barStyle = .black
        toolbar.barTintColor = UIColor.white
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.black
        toolbar.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        toolbar.layer.borderWidth = 0.5
        toolbar.sizeToFit()
        
        let items: [UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closePicker))
        ]
        toolbar.setItems(items, animated: false)
        
        toolbar.isUserInteractionEnabled = true
        
        typeTextfield.inputAccessoryView = toolbar
        typeTextfield.reloadInputViews()
        pickerView.reloadInputViews()
    }
    
    @objc private func closePicker() {
        typeTextfield.resignFirstResponder()
        pickerView(pickerView, didSelectRow: pickerView.selectedRow(inComponent: 0),
                   inComponent: 0)
    }
    
}

extension BaseTypeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextfield.text = pickerItems[row].name
    }
    
}
