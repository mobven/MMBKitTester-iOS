//
//  MMBRadioButtonView.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

protocol MMBRadioButtonViewDataSource: AnyObject {
    func numberOfRadioButtons(_ view: MMBRadioButtonView) -> Int
    func radioButon(_ view: MMBRadioButtonView, radioButonAt row: Int) -> UIView
}

protocol MMBRadioButtonViewDelegate: AnyObject {
    func radioButon(_ view: MMBRadioButtonView, didSelectAt row: Int)
}


class MMBRadioButtonView: UIView {
    
    var stackView: UIStackView!

    weak var dataSource: MMBRadioButtonViewDataSource? {
        didSet {
            self.reloadData()
        }
    }
    
    weak var delegate: MMBRadioButtonViewDelegate?
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.setupStackView()
    }
    
    func setupStackView() {
        self.stackView = UIStackView(arrangedSubviews: [])
        self.stackView.spacing = 4
        self.stackView.axis = .vertical
        self.stackView.frame = self.bounds
        self.stackView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        self.reloadData()
    }
    
    func reloadData() {
        if let dataSource = dataSource, dataSource.numberOfRadioButtons(self) > 1 {
            for index in (0..<dataSource.numberOfRadioButtons(self)) {
                let radioItem = dataSource.radioButon(self, radioButonAt: index)
                radioItem.translatesAutoresizingMaskIntoConstraints = false
                radioItem.heightAnchor.constraint(equalToConstant: 30).isActive = true
                radioItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(radioItemSelected(_:))))
                self.stackView.insertArrangedSubview(radioItem, at: index)
            }
        }
        self.layoutSubviews()
    }
    
    @objc func radioItemSelected(_ gesture: UITapGestureRecognizer) {
        guard let index = self.stackView.arrangedSubviews.firstIndex(where: {$0 == gesture.view}) else { return }
        self.delegate?.radioButon(self, didSelectAt: index)
        
        self.stackView.arrangedSubviews.enumerated().forEach { (rowIndex, item) in
            if let item = item as? MMBRadioButtonItem {
                item.isSelected = rowIndex == index
            }
        }
    }
}

