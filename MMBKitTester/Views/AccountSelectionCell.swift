//
//  AccountSelectionCell.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class AccountSelectionCell: UITableViewCell {

    @IBOutlet weak var accountView: AccountView!
    
    func configure(data: Forms.Field.Option?) {
        self.accountView.configure(option: data)
    }
}
