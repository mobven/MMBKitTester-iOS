//
//  FCMCurl.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 06.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

class FCMCurl {
    
    // swiftlint:disable line_length
    static let serverKey = "AAAAi-1C4SM:APA91bEg8bkso_0a8m3HGidShww5IgkmUOROKJimkbrlpB67BvYgq1mWqmcG56RflzSZE0dVHag4F4bBxklyU_bxc9gi2ALaPhY1ltoTnPo2hhOyDBXqTkKlHOyNh5w2mGJrO99V9vd4"
    // swiftlint:enable line_length
    
    /// Sends a push notification to fcm server for the current application and device.
    /// Lately, `paylodUrl` will be used for OneLink redirection.
    /// Normally this notification will be sent via from your backend or FCM interface.
    static func sendNotification(firebaseInstanceId: String, payloadUrl: String) {
        var urlRequest = URLRequest(
            url: URL(string: "https://fcm.googleapis.com/fcm/send")!,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 5
        )
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("key=\(serverKey)", forHTTPHeaderField: "Authorization")
        
        let payload = Payload(to: firebaseInstanceId,
                              notification: Payload.Notification(
                                body: "Notification for url: \(payloadUrl)",
                                data: payloadUrl)
        )
        
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONEncoder().encode(payload)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let data = data, let response = String(data: data, encoding: .utf8) {
                print("FCM success: \(response)")
            } else {
                print("FCM failure: \(error?.localizedDescription ?? "")")
            }
        }.resume()
    }
    
}
