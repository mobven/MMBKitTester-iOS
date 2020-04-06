//
//  AppLink.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 05.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import OneLink

enum AppLink: OneLinkable {
    
    case announcements
    case cardDetail(String)
    
    init?(url: URL) {
        self.init(url: url.absoluteString)
    }
    
    init?(url: String) {
        if url.hasPrefix("https://bkt.com/announcements") {
            self = .announcements
        } else if url.hasPrefix("https://bkt.com/cards/?id=") {
            self = .cardDetail(
                url.replacingOccurrences(of: "https://bkt.com/cards/?id=", with: "")
            )
        } else {
            return nil
        }
    }
    
    var viewController: UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch self {
        case .announcements:
            guard let viewController = storyboard
                .instantiateViewController(withIdentifier: "Announcements") as? AnnouncementsViewController else {
                    fatalError("Announcements view controller could not be instantiated!")
            }
            return viewController
        case .cardDetail(let cardId):
            guard let viewController = storyboard
                .instantiateViewController(withIdentifier: "CardDetail") as? CardDetailViewController else {
                    fatalError("Announcements view controller could not be instantiated!")
            }
            viewController.cardId = cardId
            return viewController
        }
    }
    
    var state: OneLinkableState {
        switch self {
        case .announcements:
            return .immediate
        case .cardDetail:
            return .waitingForApproval
        }
    }
    
}
