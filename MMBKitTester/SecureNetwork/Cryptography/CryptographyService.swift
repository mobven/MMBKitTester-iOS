//
//  CryptographyService.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 3.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import SecureNetwork
import Networking

enum CryptoAPI: CryptoNetworkable {
    case getNumbers(request: TestNumbersCodable)

    var request: URLRequest {
        switch self {
        case .getNumbers(let request):
            return getRequest(
                url: URL(forceString: "https://capture.mobven.com/crypt/aes/getNumbers.php"),
                encodable: request
            )
        }
    }
}

struct AESEncryptRequest: Encodable {
    
    let data: String
    let key: String
    // swiftlint:disable identifier_name
    let iv: String
    // swiftlint:enable identifier_name
    
}

struct TestCodable: Codable {
    
    var name: String
    var surname: String
    
}

struct TestNumbersCodable: Codable {
    
    var count: Int
    
}

struct TestNumbersResponse: Codable {
    
    var numbers: [Int]?
    
}
