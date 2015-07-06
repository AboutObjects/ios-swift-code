# CoolAndSwift Lab Exercise

## Stage 6: Responder Chain

Add a view controller and controls for creating and editing cool views.

1. Rename the `CoolView` class `CoolViewCell`.
2. Add a new subclass of `UIView` named `CoolView` that will be responsible for
    managing an array of cool cells.
n. Add a custom subclass of `UIViewController` named `CoolViewController`.

_TODO: Complete the instructions._


## NOTES

### AppDelegate

Integrate CoolView and CoolViewCell.

### CoolViewCell

* Add convenience init method:

```swift
convenience init(text: NSString, color: UIColor = UIColor.blueColor())
{
    // NOTE: Important to use `self` rather than `super` here.
    self.init(frame: CGRectZero)

    self.backgroundColor = color
    self.text = text
    self.sizeToFit()
}
```
    
* Add `selected` property that toggles highlighted property. Replace references.

### CoolView

* UIResponder:

Override `touchesBegan(...)` to trigger changes to selection.

* Properties:

```swift
    var cells = [CoolViewCell]()
    var previousCellFrame: CGRect = CGRectZero
    var selectedCell: CoolViewCell? = nil {
        willSet { newValue?.selected = true }
    }
```

* Adding cells:

```swift
func addCell(text: String, color: UIColor? = nil, origin: CGPoint? = CGPointZero)
```

* Handling selection

```swift
    func handleSelection(#cell: CoolViewCell)
    {
        cells.perform { (cell: CoolViewCell) in cell.selected = false }
        
        selectedCell = cell === selectedCell ? nil : cell
    }
```


### Array+CoolExtensions

```swift
extension Array
{
    func perform(closure: (T) -> ())
    {
        for currElement in self {
            closure(currElement)
        }
    }
}
```


