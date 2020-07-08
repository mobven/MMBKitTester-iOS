//
//  OAUTHService.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import MBSecureNetwork

enum OAUTHService: OAuthNetworkable {
    
    case albums
    case tracks
    
    var request: URLRequest {
        switch self {
        case .albums:
            let url = URL(forceString: "https://api.spotify.com/v1/albums/6akEvsycLGftJxYudPjmqK")
            return getRequest(url: url, queryItems: [:])
        case .tracks:
            let url = URL(forceString: "https://api.spotify.com/v1/tracks/2TpxZ7JUBn3uw46aR7qd6V")
            return getRequest(url: url, queryItems: [:])
        }
    }
}
