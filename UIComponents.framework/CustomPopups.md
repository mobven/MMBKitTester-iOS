# CustomPopups

UIComponents provides `Alert`s to present customizable popups with classic types (with title and message) and custom content view options.

## Alerts with title and message
Any `UIViewController` can present Alert using:
```swift
let alert = Alert(title: "Warning", message: "It's really easy to show alert, isn't it?!")
alert.addAction(Alert.Button(title: "Apply", type: .default, action: { (action) in
    print("Apply")
}))
alert.addAction(Alert.Button(title: "Close", type: .destructive))
alert.present(over: self)
```

## Alerts with Custom Views
Alerts can be initialized with any `UIView` using `Alert(contentView:)`. It's important, content view to be set all constraints to allow alert to calculate its content height.
### Create view in interface builder
![Custom Popup XIB](https://github.com/mobven/UIComponents/blob/develop/Resources/custom-popup.png)

### Create view representing content view
```swift
import UIKit
import UIComponents
class CustomPopup: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    class func instance(title: String, description: String) -> CustomPopup {
        guard let view = UINib(
            nibName: String(describing: self), bundle: nil
        ).instantiate(withOwner: nil, options: nil).first as? CustomPopup else {
            fatalError("Could not initalize view")
        }
        view.titleLabel.text = title
        view.descriptionLabel.text = description
        return view
    }
}
```
### Present alert with custom view
```swift
let alert = Alert(contentView: CustomPopup.instance(title: "Summary", description: "Lorem ipsum alert."))
alert.addAction(Alert.Button(title: "Apply", type: .default, action: { (action) in
    print("Apply")
}))
alert.addAction(Alert.Button(title: "Close", type: .destructive))
alert.present(over: self)
```

## Attributes
Alerts can be customized using `Alert.appearance` options.
```swift
// Color of the title displayed using `Alert(title:message:)`       
Alert.appearance.titleColor = .blue
// Font of the title displayed using `Alert(title:message:)`
Alert.appearance.titleFont = UIFont.boldSystemFont(ofSize: 22)
// Color of the message displayed using `Alert(title:message:)`
Alert.appearance.messageColor = .darkGray
// Font of the message displayed using `Alert(title:message:)`
Alert.appearance.messageFont = UIFont.systemFont(ofSize: 17)
// Text color of the button with `default` type.
Alert.appearance.defaultButtonTextColor = .white
// Background color of the button with `default` type.
Alert.appearance.defaultButtonBackgroundColor = .orange
// Font of the button with `default` type.
Alert.appearance.defaultButtonFont = UIFont.boldSystemFont(ofSize: 17)
// Text color of the button with `destructive` type.
Alert.appearance.destructiveButtonTextColor = .white
// Background color of the button with `destructive` type.
Alert.appearance.destructiveButtonBackgroundColor = .lightGray
// Font of the button with `destructive` type.
Alert.appearance.destructiveButtonFont = UIFont.boldSystemFont(ofSize: 17)
// Content insets for custom alert view. Default  value is 20 all around.
Alert.appearance.customViewContentInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
```
