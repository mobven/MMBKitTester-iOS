//
//  PinsModel.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 11.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import PinLocator

struct CustomPin: Pinnable {

    var title: String
    var icon: UIImage?
    var description: String
    var routeButtonTitle: String
    var location: PinLocation
    var binderBuilder: PinLocatorView.Binder.Builder {
        DefaultPinViewBinder.builder
    }
    
}
