//
//  ImageViewExtensions.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImage(_ url: String?) {
        guard let urlString = url else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let data = data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
