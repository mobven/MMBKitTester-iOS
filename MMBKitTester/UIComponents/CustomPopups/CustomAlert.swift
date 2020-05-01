//
//  CustomAlert.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 01.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents

class CustomAlert: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    class func instance(title: String, description: String) -> CustomAlert {
        guard let view = UINib(
            nibName: String(describing: self), bundle: nil
        ).instantiate(withOwner: nil, options: nil).first as? CustomAlert else {
            fatalError("Could not initalize view")
        }
        view.titleLabel.text = title
        view.descriptionLabel.text = description
        return view
    }
    
}
