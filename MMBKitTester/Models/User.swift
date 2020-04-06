//
//  User.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 06.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

class User {
    
    static let shared: User = User()
    
    /// Set true if user is logged in.
    var isLoggedIn: Bool = false
    
}
