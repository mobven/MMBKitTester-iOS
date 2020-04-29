//
//  AmountInputView.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 29.04.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents

class AmountInputViewController: UIViewController {
    
    @IBOutlet weak var amountInputView: AmountInputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInputViewFeatures(amountInputView,
                             placeholder: "Amount",
                             groupingSeparator: ".",
                             decimalSeparator: ",")
    }
    
    private func setInputViewFeatures(_ inputView: AmountInputView,
                                      placeholder: String,
                                      groupingSeparator: String,
                                      decimalSeparator: String) {
        inputView.backgroundColor = .lightGray
        inputView.layer.cornerRadius = 5
        inputView.currencies = ["TRY", "USD"]
        inputView.currencyItemFont = UIFont.systemFont(ofSize: 17)
        inputView.tintColor = UIColor.blue
        inputView.inactiveColor = UIColor.darkGray
        inputView.textfield.placeholder = placeholder
        inputView.textfield.textAlignment = .right
        inputView.delegate = self
        inputView.groupingSeparator = groupingSeparator
        inputView.decimalSeparator = decimalSeparator
    }
    
}

extension AmountInputViewController: AmountInputViewDelegate {
    
    func amountInputView(_ inputView: AmountInputView, didSelectCurrencyAt index: Int) {
        let amount = inputView.amount
        print("Currency \(amount.currency) with \(amount.amount ?? 0)")
    }
    
}
