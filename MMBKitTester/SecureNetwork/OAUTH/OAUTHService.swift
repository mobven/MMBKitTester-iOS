//
//  OAUTHService.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import SecureNetwork

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

struct TracksRoot: Decodable {
    let tracks: Track?
}

struct Track: Decodable {
    let items: [Item]?
}

struct Item: Decodable {
    let id: String?
    let name: String?
    let artists : [Artist]?
}

struct AlbumsRoot: Decodable {
    let id: String?
    let name: String?
    let album: Album?
}

struct Album: Decodable {
    let images: [Image]?
    let name: String?
    let artists : [Artist]?
}

struct Image: Decodable {
    let height: Int?
    let url: String?
    let width: Int?
}

struct Artist: Decodable {
    let id: String?
    let name: String?
}
