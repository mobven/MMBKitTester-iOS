//
//  MMBTextView.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 15.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class MMBTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.mmbBlue.cgColor
        self.layer.cornerRadius = 4
        self.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
