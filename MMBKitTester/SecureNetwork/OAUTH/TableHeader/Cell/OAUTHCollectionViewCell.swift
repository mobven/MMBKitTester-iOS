//
//  OAUTHCollectionViewCell.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class OAUTHCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerNameLabel: UILabel!
    
    func configure(_ data: Album?) {
        if let data = data {
            self.imageView.downloadImage(data.images?.first?.url)
            self.titleLabel.text = data.name
            self.singerNameLabel.text = data.artists?.first?.name
        }
    }

}
