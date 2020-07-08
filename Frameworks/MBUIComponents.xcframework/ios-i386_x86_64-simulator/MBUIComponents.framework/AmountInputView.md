# Amount-Input View

AmountInputView is a UI component with numeric input and currency picker. It can be created both using xcode interface builder or programmatically.

## Storyboard
Add a UIView to your interface builder and change its class to AmountInputView from UIComponents module.
![Storyboard for AmountInputView](https://github.com/mobven/UIComponents/blob/develop/Resources/amount-input-view-storyboard.png)

## Programmatically
You can create and set all attributes of AmountInputView programmatically.
```swift
let inputView = AmountInputView()
// Textfield delegate functions.
inputView.delegate = self
inputView.currencies = ["TRY", "USD"]
// Font of the currency item. Inactive currencies are %50 decreased by size. 
inputView.currencyItemFont = UIFont.systemFont(ofSize: 17)
// Tint color is used for selected currency and amount text colors
inputView.tintColor = .blue
// Color of the amount placeholder and inactive currencies.
inputView.inactiveColor = .darkGray
inputView.textfield.placeholder = "Amount"
inputView.textfield.textAlignment = .right
view.addSubview(inputView)
```

AmountInputView delegates `UITextField` functions with `AmountInputViewDelegate`.
```swift
extension ViewController: AmountInputViewDelegate {
    func amountInputView(_ inputView: AmountInputView, didSelectCurrencyAt index: Int) {
        let amount = inputView.amount
        print("Currency \(amount.currency) with \(amount.amount ?? 0)")
    }
    
    func amountInputViewShouldReturn(_ inputView: AmountInputView) -> Bool {
        inputView.endEditing(false)
    }
}
```
