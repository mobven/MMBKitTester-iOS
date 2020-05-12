//
//  MMBTextField.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class MMBTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.mmbBlue.cgColor
        self.borderStyle = .roundedRect
        self.layer.cornerRadius = 4
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
