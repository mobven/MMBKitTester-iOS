//
//  NotificationPayload.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 06.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

struct Payload: Encodable {
    var to: String
    var notification: Notification
    struct Notification: Encodable {
        var body: String
        var data: String
    }
}
