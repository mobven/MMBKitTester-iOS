//
//  SpotifyModels.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 09.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

struct TracksRoot: Decodable {
    let tracks: Track?
}

struct Track: Decodable {
    let items: [Item]?
    
    struct Item: Decodable {
        // swiftlint:disable identifier_name
        let id: String?
        // swiftlint:enable identifier_name
        let name: String?
        let artists: [Artist]?
    }
    
}

struct AlbumsRoot: Decodable {
    // swiftlint:disable identifier_name
    let id: String?
    // swiftlint:enable identifier_name
    let name: String?
    let album: Album?
}

struct Album: Decodable {
    
    let images: [Image]?
    let name: String?
    let artists: [Artist]?
    
    struct Image: Decodable {
        let height: Int?
        let url: String?
        let width: Int?
    }
    
}

struct Artist: Decodable {
    // swiftlint:disable identifier_name
    let id: String?
    // swiftlint:enable identifier_name
    let name: String?
}
