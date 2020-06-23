//
//  CryptographyViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 1.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import SecureNetwork

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
        let rsaPublicKey: String = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCyLNbf8jtBlVTGjJZmiRzRhO1ybGKlZpvaL5VbBFTJCKypyc7kpTtOuXRgCY+jYbZ4+OKHicvy9pE8qSqSzFOxXmGK00gziT+8lc0fpk8SLFeE/H1RF+qjh1k4zmqmSRe576bcLGRAJW0NtSWS+/+VwQFyyUjRM67OjCh4huRaGwIDAQAB"
         // swiftlint:enable line_length
         
         SecureNetwork.shared().enableCryptography(
             handShakeEndpoint: URL(
                 forceString: "https://capture.mobven.com/crypt/rsa/validData.php"
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
