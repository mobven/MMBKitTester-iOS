# Add-on Features

UIComponents provides `UIPickerTextfield` and `UIDatePickerTextfield` to easily implement textfield with picker input.

## UIPickerTextfield
After adding outlet of `UIPickerTextfield` from `UIComponents` module from storyboard (or create programmatically):
```swift
class ViewController: UIViewController {
    @IBOutlet weak var pickerTextfield: UIPickerTextfield!
    var colors: [String] = [
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Pink",
        "Black"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerTextfield.pickerDelegate = self
        pickerTextfield.setToolbar(title: "Select Color", button: "Close", target: self, action: #selector(closePicker))
    }
    
    @objc private func closePicker() {
        _ = pickerTextfield.resignFirstResponder()
    }
}

extension ViewController: UIPickerTextfieldDelegate {
    func pickerTextfieldNumberOfRows(_ pickerTextfield: UIPickerTextfield) -> Int {
        return colors.count
    }
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, titleForRow row: Int) -> String? {
        return colors[row]
    }
    func pickerTextfield(_ pickerTextfield: UIPickerTextfield, didSelectRow row: Int) {
        print("Color is selected at \(row): \(colors[row])")
    }
}
```

## UIDatePickerTextfield
After adding outlet of `UIDatePickerTextfield` from `UIComponents` module from storyboard (or create programmatically):
```swift
class ViewController: UIViewController {
    @IBOutlet weak var datePickerTextfield: UIDatePickerTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerTextfield.setToolbar(title: "Select Date", button: "Close", target: self, action: #selector(closeDatePicker))
        datePickerTextfield.dateFormat = "dd/MMM/yyyy"
        datePickerTextfield.datePicker.maximumDate = Date()
        datePickerTextfield.datePicker.datePickerMode = .dateAndTime
    }
    @objc private func closeDatePicker() {
        _ = datePickerTextfield.resignFirstResponder()
    }
}
```

## Picker appearance
Pickers can be customized using `UIPickerTextfield.appearance` options.
*Warning*: If your application supports dark/light mode appearance, use colors which have both color state.
```swift
// Background color of the picker view. Default is UIColor.systemWhite.
UIPickerTextfield.appearance.pickerBackgroundColor = UIColor.systemWhite
```

## UIToolbar over UITextField input
UIComponents gives an extension to any `UITextField` to show toolbar over input view (eg. keyboard, picker) 
```swift
textfield.setToolbar(title: "Username", button: "Close", target: self, action: #selector(closeDatePicker))
```

### Toolbar appearance
Toolbars can be customized using `UIToolbar.appearance` options.
*Warning*: If your application supports dark/light mode appearance, use colors which have both color state.
```swift 
// Bar tint color.
UIToolbar.appearance.barTintColor = UIColor.systemWhite 
// Tint color.
UIToolbar.appearance.tintColor = UIColor.systemBlack
// Layer border color.
UIToolbar.appearance.layerBorderColor = UIColor(light: UIColor(white: 0.8, alpha: 1.0), dark: UIColor(white: 0.2, alpha: 1.0))
// Layer border width.
UIToolbar.appearance.layerBorderWidth = 0.5
// Button font.
UIToolbar.appearance.buttonFont = UIFont.systemFont(ofSize: 14)
// Button text color.
UIToolbar.appearance.buttonTextColor = UIColor.systemBlack
// Title font.
UIToolbar.appearance.titleFont = UIFont.systemFont(ofSize: 16)
// Title text color.
UIToolbar.appearance.titleTextColor = UIColor.systemBlack
```
