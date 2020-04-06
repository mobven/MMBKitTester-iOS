//
//  CardDetailsViewController.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 05.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    @IBOutlet private weak var cardIdLabel: UILabel!
    
    var cardId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cardId = cardId {
            cardIdLabel.text = "Card ID: \(cardId)"
        }
    }
    
}
