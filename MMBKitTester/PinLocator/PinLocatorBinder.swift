//
//  PinLocatorBinder.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 17.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import PinLocator

public class PinLocatorBinder: PinLocatorView.Binder {
    
    typealias PinViewType = CustomPinLocatorView
    
    public class var builder: PinLocatorView.Binder.Builder {
        return Builder(binder: Self.self, viewType: PinViewType.self)
    }
    
    required public init(view: UIView, pin: Pinnable, delegate: PinBinderDelegate) {
        super.init(view: view, pin: pin, delegate: delegate)
        (self.view as? PinViewType)?.setPin(pin)
        (self.view as? PinViewType)?.delegate = self
    }
    
}

extension PinLocatorBinder: CustomPinLocatorViewDelegate {
    func routeTapped(_ forPin: Pinnable?) {
        guard let pin = forPin else { return }
        self.delegate?.pinBinderAction(binder: self, pin: pin)
    }
}
