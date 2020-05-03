//
//  AddOnFeaturesViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 03.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents

class AddOnFeaturesViewController: UIViewController {
    
    @IBOutlet weak var pickerTextfield: UIPickerTextfield!
    var colors: [String] = [
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Pink",
        "Black"
    ]
    
    @IBOutlet weak var datePickerTextfield: UIDatePickerTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerTextfield.pickerDelegate = self
        pickerTextfield.setToolbar(title: "Select Color", button: "Close", target: self, action: #selector(closePicker))
        
        datePickerTextfield.setToolbar(title: "Select Date", button: "Close",
                                       target: self, action: #selector(closeDatePicker))
        datePickerTextfield.dateFormat = "dd/MMM/yyyy"
        datePickerTextfield.datePicker.maximumDate = Date()
        datePickerTextfield.datePicker.datePickerMode = .dateAndTime
    }
    
    @objc private func closePicker() {
        _ = pickerTextfield.resignFirstResponder()
    }
    
    @objc private func closeDatePicker() {
        _ = datePickerTextfield.resignFirstResponder()
    }
}

extension AddOnFeaturesViewController: UIPickerTextfieldDelegate {
    
    func pickerTextfieldNumberOfRows(_ pickerTextfield: UIPickerTextfield) -> Int {
        return colors.count
    }
    
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, titleForRow row: Int) -> String? {
        return colors[row]
    }
    
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, didSelectRow row: Int) {
        print("Color is selected at \(row): \(colors[row])")
    }
    
}
