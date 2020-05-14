//
//  UIViewExtension.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

extension UIView {
    
    func addFullConstraint(_ subView: UIView,
                           edges: UIEdgeInsets) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.topAnchor.constraint(equalTo: self.topAnchor,
                                         constant: edges.top),
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                             constant: edges.left),
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                              constant: -edges.right),
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                            constant: -edges.bottom)
        ])
    }
    
}
 
