# Key-Value List

KeyValueList can be created both using xcode interface builder or programmatically. They have similar implementation to `UITableView` with easy customization options.

## Storyboard
Add a UIView to your interface builder and change its class to KeyValueList from UIComponents module.
![Storyboard for KeyValueLabel](https://github.com/mobven/UIComponents/blob/develop/Resources/key-value-list-storyboard.png)

## Programmatically
You can create and set all attributes of KeyValuelist programmatically.
```swift
let keyValueList = KeyValueList()
keyValueList.delegate = self
keyValueList.backgroundColor = .clear
view.addSubview(keyValueLabel)
```

Key-Value list shows data by conforming to `KeyValueListDelegate` which has similar implementation to [UITableView](https://developer.apple.com/documentation/uikit/uitableview)
```swift
class ViewController: UIViewController {

    @IBOutlet weak var keyValueList: KeyValueList!
    
    typealias KeyValue = ((key: String, value: String))
    typealias KeyValueSection = ((title: String, list: [KeyValue]))
    var data: [KeyValueSection] = [
        KeyValueSection(
            title: "Title 1",
            list: [
                KeyValue(key: "Value Date", value: "04.06.2020"),
                KeyValue(key: "Amount", value: "1,236.00 $"),
                KeyValue(key: "Description", value: "Lorem Ipsum")
            ]
        ),
        KeyValueSection(
            title: "Title 2",
            list: [
                KeyValue(key: "Value Date", value: "04.06.2020"),
                KeyValue(key: "Amount", value: "1,236.00 $"),
                KeyValue(key: "Description", value: "Lorem Ipsum")
            ]
        ),
        KeyValueSection(
            title: "Title 3",
            list: [
                KeyValue(key: "Value Date", value: "04.06.2020"),
                KeyValue(key: "Amount", value: "1,236.00 $"),
                KeyValue(key: "Description", value: "Lorem Ipsum")
            ]
        ),
        KeyValueSection(
            title: "Title 4",
            list: [
                KeyValue(key: "Value Date", value: "04.06.2020"),
                KeyValue(key: "Amount", value: "1,236.00 $"),
                KeyValue(key: "Description", value: "Lorem Ipsum")
            ]
        ),
        KeyValueSection(
            title: "Title 5",
            list: [
                KeyValue(key: "Value Date", value: "04.06.2020"),
                KeyValue(key: "Amount", value: "1,236.00 $"),
                KeyValue(key: "Description", value: "Lorem Ipsum")
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyValueList.delegate = self
        keyValueList.backgroundColor = .clear
    }

}

extension ViewController: KeyValueListDelegate {
    
    func numberOfSections(in keyValueList: KeyValueList) -> Int {
        return data.count
    }
    
    func keyValueList(_ keyValueList: KeyValueList, numberOfLabelsInSection section: Int) -> Int {
        return data[section].list.count
    }
    
    func keyValueList(_ keyValueList: KeyValueList, labelFor indexPath: IndexPath) -> KeyValueLabel {
        let label = keyValueList.dequeueReusableLabel(for: indexPath)
        label.orientation = .horizontal
        label.multilineOption = .singleLineKey
        label.verticalAlignment = .top
        label.margin = 10
        
        label.insets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        label.keyText = data[indexPath.section].list[indexPath.row].key
        label.keyTextColor = UIColor.lightGray
        
        label.valueText = data[indexPath.section].list[indexPath.row].value
        label.valueAlignment = .right
        label.valueTextColor = UIColor.blue
        return label
    }
    
    func keyValueList(_ keyValueList: KeyValueList, didTapLabelAt indexPath: IndexPath) {
        print("Label tapped at: \(indexPath.row)")
    }
    
    func keyValueList(_ keyValueList: KeyValueList, separatorInsetFor indexPath: IndexPath) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func keyValueList(_ keyValueList: KeyValueList, titleForHeaderInSection section: Int) -> KeyValueListTitleLabel? {
        let header = keyValueList.dequeueReusableHeaderLabel()
        header.text = data[section].title
        header.textColor = UIColor.blue
        header.insets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return header
    }
    
    func keyValueList(_ keyValueList: KeyValueList, separatorColorForFooterInSection section: Int) -> UIColor? {
        return UIColor.gray
    }
    
    func keyValueList(_ keyValueList: KeyValueList, separatorInsetForFooterInSection section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
```
