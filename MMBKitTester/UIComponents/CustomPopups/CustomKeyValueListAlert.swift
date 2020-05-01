//
//  CustomKeyValueListAlert.swift
//  MMBKitTester
//
//  Created by Rasid Ramazanov on 01.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import UIComponents

class CustomKeyValueListAlert: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var keyValueList: KeyValueList!
    
    typealias KeyValue = ((key: String, value: String))
    var data: [KeyValue] = [
        KeyValue(key: "Value Date", value: "04.06.2020"),
        KeyValue(key: "Amount", value: "1,236.00 $"),
        KeyValue(key: "Description", value: "Lorem Ipsum"),
        KeyValue(key: "Value Date", value: "04.06.2020"),
        KeyValue(key: "Amount", value: "1,236.00 $"),
        KeyValue(key: "Description",
                 value: "Lorem Ipsum more longer than regular lorem ipsum texts."),
        KeyValue(key: "Value Date", value: "04.06.2020"),
        KeyValue(key: "Amount", value: "1,236.00 $"),
        KeyValue(key: "Description", value: "Lorem Ipsum")
    ]
    
    class func instance(title: String) -> CustomKeyValueListAlert {
        guard let view = UINib(
            nibName: String(describing: self), bundle: nil
        ).instantiate(withOwner: nil, options: nil).first as? CustomKeyValueListAlert else {
            fatalError("Could not initalize view")
        }
        view.titleLabel.text = title
        view.keyValueList.delegate = view
        return view
    }
    
}

extension CustomKeyValueListAlert: KeyValueListDelegate {
    
    func numberOfSections(in keyValueList: KeyValueList) -> Int {
        return 1
    }
    
    func keyValueList(_ keyValueList: KeyValueList, numberOfLabelsInSection section: Int) -> Int {
        return data.count
    }
    
    func keyValueList(_ keyValueList: KeyValueList, labelFor indexPath: IndexPath) -> KeyValueLabel {
        let label = keyValueList.dequeueReusableLabel(for: indexPath)
        label.orientation = .horizontal
        label.multilineOption = .singleLineKey
        label.verticalAlignment = .top
        label.margin = 10
        
        label.insets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        label.keyText = data[indexPath.row].key
        label.keyTextColor = UIColor.lightGray
        
        label.valueText = data[indexPath.row].value
        label.valueAlignment = .right
        label.valueTextColor = UIColor.darkGray
        return label
    }
    
    func keyValueList(_ keyValueList: KeyValueList, separatorInsetFor indexPath: IndexPath) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
