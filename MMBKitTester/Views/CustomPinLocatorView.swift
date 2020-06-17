//
//  CustomPinLocatorView.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 17.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import PinLocator

protocol CustomPinLocatorViewDelegate: AnyObject {
    func routeTapped(_ forPin: Pinnable?)
}

class CustomPinLocatorView: UIView {
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()

    private lazy var routeButton: UIButton = {
        var button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(routeTapped), for: .touchUpInside)
        return button
    }()
    
    var verticalStackView: UIStackView!
    var horizontalStackView: UIStackView!
    
    weak var delegate: CustomPinLocatorViewDelegate?
    var insets: CGFloat = 4
    
    var pin: Pinnable?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .white
        self.setupVerticalStackView()
    }
    
    func setupVerticalStackView() {
        self.verticalStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                descriptionLabel])
        self.verticalStackView.spacing = 8
        self.verticalStackView.axis = .vertical
        self.setupHorizontalStackView()
    }
    
    func setupHorizontalStackView() {
        self.horizontalStackView = UIStackView(arrangedSubviews: [verticalStackView,
                                                                  routeButton])
        self.horizontalStackView.spacing = 8
        self.horizontalStackView.axis = .horizontal
                
        self.addSubview(horizontalStackView)
        self.addFullConstraint(horizontalStackView,
                               edges: UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets))
        self.horizontalStackView.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func setPin(_ pin: Pinnable) {
        self.pin = pin
        self.titleLabel.text = pin.title
        self.descriptionLabel.text = pin.description
        self.routeButton.setTitle(pin.routeButtonTitle, for: .normal)
        
        let titleHeight = pin.title.height(withConstrainedWidth: 160,
                                           font: UIFont.systemFont(ofSize: 16, weight: .regular))
        
        let descriptionHeight = pin.description.height(withConstrainedWidth: 160,
                                                       font: UIFont.systemFont(ofSize: 14, weight: .regular))
        
        self.frame = CGRect(x: 0, y: 0,
                            width: 220 + insets * 2,
                            height: titleHeight
                                    + descriptionHeight
                                    + verticalStackView.spacing * CGFloat(verticalStackView.arrangedSubviews.count)
                                    + insets * 2)
        
    }
    
    @objc func routeTapped() {
        self.delegate?.routeTapped(pin)
    }
}
