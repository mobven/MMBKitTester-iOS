# Key-Value Label

KeyValueLabels can be created both using xcode interface builder or programmatically. Their content size are calculated according to size of the labels.

## Storyboard
Add a UIView to your interface builder and change its class to KeyValueLabel from UIComponents module.
![Storyboard for KeyValueLabel](https://github.com/mobven/UIComponents/blob/develop/Resources/key-value-label-storyboard.png)

## Programmatically
You can create and set all attributes of KeyValueLabel programmatically
```swift
let keyValueLabel = KeyValueLabel()
keyValueLabel.verticalAlignment = .top
keyValueLabel.multilineOption = .equal
keyValueLabel.margin = 10
keyValueLabel.orientation = .horizontal
keyValueLabel.keyText = "Key:"
keyValueLabel.valueText = "Some Value"
keyValueLabel.keyTextColor = UIColor.red
keyValueLabel.valueTextColor = UIColor.blue
keyValueLabel.keyLineBreakMode = .byCharWrapping
keyValueLabel.valueLineBreakMode = .byWordWrapping
keyValueLabel.valueAlignment = .right
keyValueLabel.keyAdjustsFontSizeToFitWidth = true
keyValueLabel.valueAdjustsFontSizeToFitWidth = true
keyValueLabel.keyMinimumScaleFactor = 0.5
keyValueLabel.valueMinimumScaleFactor = 0.7
view.addSubview(keyValueLabel)
```

## Attributes

### Orientation
KeyValueLabels support horizontal and vertical `orientation`. Vertical labels are straightforward and may have only `margin` between them, where horizontal labels have detailed attributes.

### Vertical Alignment
`VerticalAlignment` is for aligning texts in single-line labels where the other label (eg. value label) is multi-lined:
![Vertical Alignment](https://github.com/mobven/UIComponents/blob/develop/Resources/key-value-label-valign.png)

### Multiline Option
`MultilineOption` is deciding how key-value will share content view:
- `equal` : Both key and value are multi-lined with equal width. Component with greater height would decide for the height of the content.
- `singleLineKey` : Key is single line, value is multi-lined. Value decides for content height, key decides for width of key (remaining area is for value).
- `singleLineValue` : Key is multi-lined, value is single line. Key decides for content height, value decides for value width (remaining area is for key).
![Multiline Option](https://github.com/mobven/UIComponents/blob/develop/Resources/key-value-label-multilining.png)

## Usage in UITableViewCell
We provide Key-Value List to list KeyValueLabels in the list, which is really easy-to-use. But KeyValueLabel is not restricted in usage. If you want to implement it in a custom UITableViewCell, be sure overriding:
```swift
override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                      withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                      verticalFittingPriority: UILayoutPriority) -> CGSize {
    keyValueLabel.preferredMaxLayoutWidth = targetSize.width
    keyValueLabel.invalidateIntrinsicContentSize()
    return super.systemLayoutSizeFitting(targetSize,
                                         withHorizontalFittingPriority: horizontalFittingPriority,
                                         verticalFittingPriority: verticalFittingPriority)
}
```
