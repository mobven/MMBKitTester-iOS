//
//  CustomXibPinView.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 23.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import MBPinLocator

// PinLocatorView currently does not support PinViews from XIB files.
// This is planned in the feature releases.
class CustomXibPinView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var routeButton: UIButton!
    
    weak var delegate: CustomPinLocatorViewDelegate?
    var pin: Pinnable?
    
    class func instance() -> CustomXibPinView {
        guard let view = UINib(
            nibName: String(describing: self), bundle: nil
        ).instantiate(withOwner: nil, options: nil).first as? CustomXibPinView else {
            fatalError("Could not initalize view")
        }
        view.setup()
        return view
    }
    
    func setup() {
        
    }
    
    func setPin(_ pin: Pinnable) {
        self.pin = pin
        self.titleLabel.text = pin.title
        self.infoLabel.text = pin.description
        self.routeButton.setTitle(pin.routeButtonTitle, for: .normal)
    }
    
    @IBAction func route() {
        self.delegate?.routeTapped(pin)
    }
    
}
