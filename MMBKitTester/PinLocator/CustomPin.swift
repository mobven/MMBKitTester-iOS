//
//  PinsModel.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 11.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBPinLocator

struct CustomPin: Pinnable {
    var icon: UIImage?
    var title: String
    var description: String
    var routeButtonTitle: String
    var location: PinLocation
    var binderBuilder: PinLocatorView.Binder.Builder {
        DefaultPinViewBinder.builder
    }
}

struct CustomLocationPin: Pinnable {
    var icon: UIImage?
    var title: String
    var description: String
    var routeButtonTitle: String
    var location: PinLocation
    var binderBuilder: PinLocatorView.Binder.Builder {
        PinLocatorBinder.builder
    }
}
