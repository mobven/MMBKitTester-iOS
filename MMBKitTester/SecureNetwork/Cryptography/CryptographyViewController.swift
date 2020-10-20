//
//  CryptographyViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 1.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBSecureNetwork

class CryptographyViewController: UIViewController {
    
    @IBOutlet weak var objectLabel: UILabel!
    @IBOutlet weak var decodedObjectLabel: UILabel!
    @IBOutlet weak var indicatorView: UIStackView!
    @IBOutlet weak var handShakeButton: UIButton!
    @IBOutlet weak var decryptionButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    var handshaked: Bool = false
    var dispatchWork: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func enableCryptography(_ sender: Any) {
        
        // swiftlint:disable line_length
        let rsaPublicKey: String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmTMX29XfKjyGZ4bwlHxq47MG0YXzp4ntvOfu8twTmZsJN2a9kPvSCY0tuDw4KNDmDjPuZuodYH0sFE51j8oVqklftimoFjXD9eOetDAHyFZNAyJvoK59GvN8ZhuZLt9kyH4Kiz3zcU3ouDNQ+NNQ/uj1deaMRkN9eEcrfpO92Mw4wEfO4ZgadkqN45JaEBCHVT6PClK8NFK8yCkYaVgMz6QhgBw59cAgwn/fh8P2XwyTd5kbdwor0SqbpIhAiA5t0YKBU26T6YS36f8b/lCbKceXONrBzs4WFpdCemxEDFL9C2zS6DGRjWpLx2edES2qHCgwVtWd4plXCmQzEIhBjwIDAQAB"
         // swiftlint:enable line_length
         
         SecureNetwork.shared().enableCryptography(
             handShakeEndpoint: URL(
                 forceString: "http://mobile-backend.bkt.com.al:8080/mobile-api-gateway/api/v1/cryptography/handshake"
             ),
             rsaPublicKey: rsaPublicKey
         )
        
        self.handShakeButton.isEnabled = true
    }
    
    @IBAction func handshake(_ sender: Any) {
        self.indicatorView.isHidden = false
        
        SecureNetwork.shared().handshake { (result, _) in
            self.handshaked = result
            self.indicatorView.isHidden = true
            self.messageLabel.isHidden = true
            self.decryptionButton.isEnabled = result
            
            if result {
                self.dispatchWork?.perform()
            }            
        }
        
        self.decryptionButton.isEnabled = true
    }
    
    @IBAction func decryption(_ sender: Any) {
        if !handshaked {
            self.messageLabel.isHidden = false
            self.dispatchWork = DispatchWorkItem {
                self.getNumbers()
            }
        } else {
            self.getNumbers()
        }
    }
    
    func getNumbers() {
        CryptoAPI.getNumbers(
            request: TestNumbersCodable(count: 2)
        ).fetch(TestNumbersResponse.self) { (result) in
            switch result {
            case .success(let response):
                print(response.numbers ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}
