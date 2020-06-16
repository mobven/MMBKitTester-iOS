//
//  PinLocatorViewController.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 11.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import PinLocator

class PinLocatorViewController: UIViewController {
    
    @IBOutlet weak var pinLocatorView: PinLocatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setPins()
    }
    
    @IBAction func segmentedTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            self.pinLocatorView.mapType = .google(apiKey: "AIzaSyCbOExJmVJcKBnZcLrJbArLV_sPtsJV18Q")
            self.setPins()
        } else {
            self.pinLocatorView.mapType = .apple
            self.setPins()
        }
    }
    
    func setPins() {
        let pins: [Pinnable] = [
            CustomPin(title: "Adalar",
                      icon: UIImage.init(named: "atm"),
                      description: "Adalar deneme description",
                      buttonTitle: "Yol Tarifi",
                      location: PinLocation(latitude: 40.8747, longitude: 29.1294)),
            CustomPin(title: "Arnavutköy",
                      icon: UIImage.init(named: "atm"),
                      description: "Arnavutköy deneme description",
                      buttonTitle: "Yol Tarifi",
                      location: PinLocation(latitude: 41.1864, longitude: 28.7389)),
            CustomPin(title: "Avcılar",
                      icon: UIImage.init(named: "atm"),
                      description: "Avcılar deneme description",
                      buttonTitle: "Yol Tarifi",
                      location: PinLocation(latitude: 40.9792, longitude: 28.7214))
        ]
        
        self.pinLocatorView.setPins(pins)
        self.pinLocatorView.setCamera(PinLocatorView.CameraPosition(zoom: 9, latitude: 40.9833, longitude: 29.1278),
                                      animated: true)
        
        //For custom detail view test
//        let detailView = CustomDetailView(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
//        detailView.routeDidTap = { pin in
//            print(pin?.description)
//        }
//        self.pinLocatorView.setDetailView(detailView)
    }
}
