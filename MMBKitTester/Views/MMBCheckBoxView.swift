//
//  MMBCheckBoxView.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 12.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

protocol MMBCheckBoxViewDelegate: AnyObject {
    func checkBox(_ checkBox: MMBCheckBoxView, isSelected: Bool)
}

class MMBCheckBoxView: UIView {
    
    var stackView: UIStackView!
    lazy var titleLabel = UILabel()
    lazy var checkBoxContentView = UIView()
    lazy var imageView = UIImageView()
    
    weak var delegate: MMBCheckBoxViewDelegate?
    
    var isSelected: Bool = false {
        didSet {
            self.delegate?.checkBox(self, isSelected: isSelected)
            self.imageView.image = isSelected ? UIImage(named: "checked"): UIImage(named: "unchecked")
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
        self.checkBoxContentView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                             action: #selector(checkBoxTapped)))
        
        self.imageView.frame = checkBoxContentView.bounds
        self.imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.imageView.image = UIImage(named: "unchecked")
        self.checkBoxContentView.addSubview(imageView)
    }
    
    func setupLabel() {
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func setupStackView() {
        self.stackView = UIStackView(arrangedSubviews: [checkBoxContentView, titleLabel])
        self.stackView.spacing = 8
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.addSubview(stackView)
        self.addFullConstraint(stackView, edges: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    @objc func checkBoxTapped() {
        self.isSelected.toggle()
    }
    
    func setTitle(_ title: String?) {
        self.titleLabel.text = title
    }
    
}
