//
//  ErrorKitSampleAPI.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 17.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import Networking

enum ErrorKitSampleAPI: Networkable {
    
    case networkingError
    case serializationError
    
    var request: URLRequest {
        switch self {
        case .networkingError:
            return getRequest(
                url: URL(forceString: "https://example.com/api/getNetworkError"),
                encodable: ErrorResponse(name: nil)
            )
        case .serializationError:
            return getRequest(
                url: URL(forceString: "https://capture.mobven.com/crypt/aes/getNumbers.php"),
                encodable: ErrorResponse(name: nil)
            )
        }
    }
    
}

struct ErrorResponse: Codable {
    var name: String?
}
