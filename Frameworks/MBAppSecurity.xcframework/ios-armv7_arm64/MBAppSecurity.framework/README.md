# App Security

Bring your app’s security to next level with easy-to-use functionalities.

## Requirements

- iOS 9.0+
- Xcode 11.3+
- Swift 5+

## Installation

### Swift Package Manager
Framework is supported only via Swift Package Manager and is not planned to be distributed otherwise, unless there is a specific requirement. As Swift Package Manager is the first official distribution tool managed by Apple for Swift, it's stable currently and there is an active development on it which promises it will be used for a while.

Project can be installed using SPM with its github URL.
```bash
https://github.com/mobven/AppSecurity
```

## Usage

### Setup
AppSecurity is initialized with singleton access to:
```swift
AppSecurity.shared.setup()
```

### Prevent Snapshots
AppSecurity supports a view to be shown when application is viewed from iPhone's app switcher screen. By setting `appSwitcherPlaceholderView`, you enable AppSecurity to register `UIApplication.willResignActiveNotification` and `UIApplication.didBecomeActiveNotification` notifications. 
```swift
let placeholderView = UIView()
placeholderView.backgroundColor = UIColor.blue
AppSecurity.shared.appSwitcherPlaceholderView = view
```

### Jailbreak/Root device detection
Setup function support options to specify app termination for jail broken devices. By default, the value is true, which terminates devices with access to private system folders.
```swift
AppSecurity.shared.setup(options: [.terminateAppForJailBrokenDevices: false])
```
Alternately, you can use isDeviceJailBroken property:
```swift
if AppSecurity.shared.isDeviceJailBroken {
    // Detected jail broken device.
}
```

### Secure Input
With `isSecure` property of both `UITextfield` and `UITextView` to disable copy, cut, paste functions, which can be set via:
#### Code
```swift
let textfield = UITextField()
textfield.isSecure = true

let textview = UITextView()
textview.isSecure = true
```

### Prevent screen recording and AirPlay mirroring
AppSecurity disables screen recording and AirPlay mirroring by providing a placeholder view to be shown when recording/mirroring starts.
```swift
let placeholderView = UIView()
placeholderView.backgroundColor = UIColor.red
AppSecurity.shared.mirroringPlaceholderView = placeholderView
```
#### Storyboard
![Storyboard for isSecure](https://github.com/mobven/AppSecurity/blob/development/Resources/textfield_is_secure.png)

### Pass Code detection
AppSecurity provides `hasDeviceOwnerAuthentication()` property to check whether device owner enabled touch id or passcode authentication. 
```swift
if !AppSecurity.shared.hasDeviceOwnerAuthentication() {
    // Device owner has no authentication enabled.
}
```

### Secure Store
Api provides security extensions for native `UserDefaults` class.
After setting up framework, set AES key and initial vector to `secureKeyValueOptions`.
```swift
AppSecurity.shared.setup()
let key = "dS84G18VdHRgVrlKcucD910OYumPqjM7" // Random generated AES key
let initialVector = "f1ede36fa3645589"       // Random generated initial vector
AppSecurity.shared.secureKeyValueOptions = (key: key, iv: initialVector)
```
It is strongly recommended that AES key and initial vector generated in server side and stored by iOS Keychain.
Then, you can use extended UserDefaults's `setSecureValue` functions. You can set and get values like following examples.
```swift
UserDefaults.standard.setSecureValue(true, forKey: "bool")
UserDefaults.standard.setSecureValue(123, forKey: "int")
UserDefaults.standard.setSecureValue(3.14, forKey: "float")
UserDefaults.standard.setSecureValue(3.1415, forKey: "double")
UserDefaults.standard.setSecureValue("lorem ipsum", forKey: "string")
UserDefaults.standard.setSecureValue(URL(string: "https://www.mobven.com/"), forKey: "url")

let myBoolValue: Bool = UserDefaults.standard.secureBool(forKey: "bool")
let myIntValue: Int = UserDefaults.standard.secureInteger(forKey: "int")
let myFloatValue: Float = UserDefaults.standard.secureFloat(forKey: "float")
let myDoubleValue: Double = UserDefaults.standard.secureDouble(forKey: "double")
let myStringValue: String? = UserDefaults.standard.secureString(forKey: "string")
let myURLValue: URL? = UserDefaults.standard.secureURL(forKey: "url")
```
You can also remove any encrypted key value pair that stored before.
```swift
UserDefaults.standard.removeSecureObject(forKey: "myKey")
```

### Force Update
`AppSecurity` brings force-update logic to your application with  `AppSecurity.shared.checkForceUpdate()` callback. 
```swift
AppSecurity.shared.checkForceUpdate() { (response, error) in
    if let response = response {
        // There is an update for your app.
        // Use response model to show alert and redirect user to AppStore.
        guard UIApplication.shared.canOpenURL(response.storeUrl) else { return }
        UIApplication.shared.open(response.storeUrl,
                                  options: [:], completionHandler: nil)
    } else {
        print(error?.localizedDescription ?? "")
        // Error occured while fetching force-update status.
        // Implement a callback to try again.
    }
}
```
If you want `AppSecurity` to show alert for you:
```swift
AppSecurity.shared.checkForceUpdate(showAlertIfNeeded: true) { (response, error) in
    if response == nil && error == nil {
        // Application is up-to-date
    } else if let error = error {
        print(error?.localizedDescription ?? "")
        // Error occured while fetching force-update status.
        // Implement a callback to try again.
    }
}
```
