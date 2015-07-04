# CoolAndSwift Lab Exercise

## Stage 2: Implement `UIResponder` Touch Event Phase Methods

Add a class named *CoolView* that highlights when touched and moves when
dragged.

**_TODO: Auto Layout version_**

### Part 1: Dragging
1. Add a `CoolView` class to the `CoolAndSwift` group.
2. Override `touchesMoved(_:withEvent:)` to modify the cool view's `frame` by
  the difference between the current and previous position of the touch.
3. Change the type of `view1` and `view2` to `CoolView` in
`application(_:didFinishLaunchingWithOptions:)`.

### Part2: Highlighting
1. Add an `Opacity` enum with constants for the normal and highlighted states.
2. Add a `highlighted` property of type `Bool` that modifies the view's `alpha`
  using the `Opacity` enum's highlighted value. (Hint: use `willSet`.)
3. Override `touchesBegan(_:withEvent:)` to highlight the view.
4. Override `touchesEnded(_:withEvent:)` and `touchesCancelled(_:withEvent:)` to
  unhighlight the view.
