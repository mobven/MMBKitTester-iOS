//
//  KeyValueLabelViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 15.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents

class KVLabelViewController: UIViewController {
    
    @IBOutlet weak var keyValueLabel1: KeyValueLabel!
    @IBOutlet weak var keyValueLabel2: KeyValueLabel!
    @IBOutlet weak var keyValueLabel3: KeyValueLabel!
    @IBOutlet weak var keyValueLabel4: KeyValueLabel!
    @IBOutlet weak var keyValueLabel5: KeyValueLabel!
    @IBOutlet weak var keyValueLabel6: KeyValueLabel!
    @IBOutlet weak var keyValueLabel7: KeyValueLabel!
    @IBOutlet weak var keyValueLabel8: KeyValueLabel!
    @IBOutlet weak var keyValueLabel9: KeyValueLabel!
    @IBOutlet weak var keyValueLabel10: KeyValueLabel!
    @IBOutlet weak var keyValueLabel11: KeyValueLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyValueLabel = KeyValueLabel()
        keyValueLabel.verticalAlignment = .top
        keyValueLabel.multilineOption = .equal
        keyValueLabel.margin = 10
        keyValueLabel.orientation = .horizontal
        keyValueLabel.keyText = "Key:"
        keyValueLabel.valueText = "Some Value"
        keyValueLabel.keyTextColor = UIColor.red
        keyValueLabel.valueTextColor = UIColor.blue
        keyValueLabel.keyLineBreakMode = .byCharWrapping
        keyValueLabel.valueLineBreakMode = .byWordWrapping
        keyValueLabel.valueAlignment = .right
        keyValueLabel.keyAdjustsFontSizeToFitWidth = true
        keyValueLabel.valueAdjustsFontSizeToFitWidth = true
        keyValueLabel.keyMinimumScaleFactor = 0.5
        keyValueLabel.valueMinimumScaleFactor = 0.7
    }
    
}
