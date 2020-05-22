//
//  OAUTHTableHeader.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 21.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

class OAUTHTableHeader: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Album]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.setupNibFile()
        self.setupCollectionView()
    }
    
    func setupNibFile() {
        Bundle.main.loadNibNamed("OAUTHTableHeader", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(contentView)
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "OAUTHCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "OAUTHCollectionViewCell")
    }
    
}

extension OAUTHTableHeader: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "OAUTHCollectionViewCell",
            for: indexPath
            ) as? OAUTHCollectionViewCell else {
            fatalError("Couldn't set OAUTHCollectionViewCell reuseIdentifier")
        }
        
        cell.configure(items?[indexPath.item])
        return cell
    }
}

extension OAUTHTableHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
