//
//  ErrorKitViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 17.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import SecureNetwork

class ErrorKitViewController: UIViewController {
    
    @IBAction func caughtNetworkingError() {
        ErrorKitSampleAPI.networkingError.fetch(ErrorResponse.self) { _ in
            
        }
    }
    
    @IBAction func caughtSerializationError() {
        ErrorKitSampleAPI.serializationError.fetch(ErrorResponse.self) { _ in
            
        }
    }
    
    @IBAction func caughtCryptographyError() {
        // swiftlint:disable line_length
        let rsaPublicKey: String = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCyLNbf8jtBlVTGjJZmiRzRhO1ybGKlZpvaL5VbBFTJCKypyc7kpTtOuXRgCY+jYbZ4+OKHicvy9pE8qSqSzFOxXmGK00gziT+8lc0fpk8SLFeE/H1RF+qjh1k4zmqmSRe576bcLGRAJW0NtSWS+/+VwQFyyUjRM67OjCh4huRaGwIDAQAB"
         // swiftlint:enable line_length
         
         SecureNetwork.shared().enableCryptography(
             handShakeEndpoint: URL(
                 forceString: "https://capture.mobven.com/crypt/rsa/validData.php"
             ),
             rsaPublicKey: rsaPublicKey
         )
        SecureNetwork.shared().handshake { (result, _) in
            if result {
                self.getNumbers()
            }
        }
    }
    
    func getNumbers() {
        CryptoAPI.getNumbers(
            request: TestNumbersCodable(count: 2)
        ).fetch(TestNumbersResponse.self) { _ in
            
        }
    }
    
}
