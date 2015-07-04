# CoolAndSwift Lab Exercise

## Stage 4: Initialize `CALayer` Properties

Add custom initialization to the `CoolView` class as follows:

1. Override `init(frame:)` and `init(coder:)` methods to call a new method named `configureLayer()`.
2. In `configureLayer()`, change the following properties of the root layer:
    1. Border width
    2. Border color
    3. Corner radius
    4. Clips to bounds
    5. Background color. Why does it seem that setting the layer's background color has no effect? See if you can discover how to make it work.
