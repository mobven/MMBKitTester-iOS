//
//  MMBRadioButtonItem.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import StateMachineForms

class MMBRadioButtonItem: UIView {
    
    var stackView: UIStackView!
    lazy var titleLabel = UILabel()
    lazy var checkBoxContentView = UIView()
    lazy var imageView = UIImageView()
    
    var isSelected: Bool = false {
        didSet {
            self.imageView.image = isSelected ? UIImage(named: "radio"): nil
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
        self.setupCheckBox()
        self.setupLabel()
        self.setupStackView()
    }

    func setupCheckBox() {
        self.checkBoxContentView.translatesAutoresizingMaskIntoConstraints = false
        self.checkBoxContentView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        self.checkBoxContentView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        self.checkBoxContentView.layer.borderWidth = 1
        self.checkBoxContentView.layer.borderColor = UIColor.lightGray.cgColor
        self.checkBoxContentView.layer.cornerRadius = 14
        
        self.addSubview(checkBoxContentView)
        self.addSubview(imageView)
        
        self.imageView.frame = CGRect(x: 4, y: 4, width: 20, height: 20)
        
        self.imageView.image = nil
        self.checkBoxContentView.addSubview(imageView)
    }
    
    func setupLabel() {
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.addSubview(titleLabel)
    }
    
    func setupStackView() {
        self.stackView = UIStackView(arrangedSubviews: [checkBoxContentView, titleLabel])
        self.stackView.spacing = 8
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.frame = self.bounds
        self.stackView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(stackView)
    }
    
    func configure(type: Forms.Field.Option?) {
        self.titleLabel.text = type?.name
    }
}
