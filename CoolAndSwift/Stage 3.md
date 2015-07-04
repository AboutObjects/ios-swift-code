# CoolAndSwift Lab Exercise

## Stage 3: Add Drawing and Resizing Behavior

Add drawing and resizing behaviors to the `CoolView` class as follows:

### Part 1
1. Add a `text` property.
2. Override `drawRect(_:)` to draw the `text` property's string value.

### Part 2
1. Add a `Padding` enum with constants for width and height, and an `amount()`
method that returns the raw value.
2. Add a `textAttributes` property that returns a dictionary containing 
instances of `UIFont` and `UIColor` to be used to customize text drawing.
3. Modify `drawRect(_:)` to apply the text attributes, and to offset the origin
of the drawn text based on the `Padding` width and height.
4. Override `sizeThatFits(_:)` to resize the `CoolView` to the padded size of
the drawn text.
5. Modify `application(_:didFinishLaunchingWithOptions:)` to call `sizeToFit`.
