//
//  Module.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 31.03.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

struct ModuleSection {
    var name: String
    var modules: [Module]
}

struct Module {
    var name: String
    var identifier: String
}
