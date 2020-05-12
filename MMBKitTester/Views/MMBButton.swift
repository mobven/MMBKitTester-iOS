//
//  MMBButton.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class MMBButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.cornerRadius = 12
        self.backgroundColor = .blue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}
