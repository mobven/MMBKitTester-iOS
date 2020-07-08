//
//  AccountView.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import MBStateMachineForms

protocol AccountViewDelegate: AnyObject {
    func accountViewDidTap()
}

class AccountView: UIView {
    
    var stackView: UIStackView!
    lazy var titleLabel = UILabel()
    lazy var descriptionLabel = UILabel()
    
    weak var delegate: AccountViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.layer.borderColor = UIColor.mmbBlue.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        
        self.setupTitleLabel()
        self.setupDescriptionLabel()
        self.setupStackView()
        self.setupGesture()
    }
    
    func setupTitleLabel() {
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.titleLabel.text = "Account No: "
        self.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func setupDescriptionLabel() {
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textAlignment = .left
        self.descriptionLabel.text = "Balance: "
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func setupStackView() {
        self.stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        self.stackView.spacing = 4
        self.stackView.axis = .vertical
        self.addSubview(stackView)
        self.addFullConstraint(stackView, edges: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func configure(option: Forms.Field.Option?) {
        self.setTitleLabel(option?.id)
        self.setDescriptionLabel(option?.name)
    }
    
    func setTitleLabel(_ title: String?) {
        self.titleLabel.text = "Account No: \(title ?? "")"
    }
    
    func setDescriptionLabel(_ description: String?) {
        self.descriptionLabel.text = "Balance: \(description ?? "")"
    }
    
    func setupGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }
    
    @objc func viewTapped() {
        self.delegate?.accountViewDidTap()
    }
}
