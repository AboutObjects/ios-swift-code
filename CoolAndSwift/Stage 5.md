# CoolAndSwift Lab Exercise

## Stage 5: Core Animation and Closures

Trigger custom CoolView animations on double-tap.

1. Add a new method with the following signature:

   `performAnimation(gestureRecognizer: UITapGestureRecognizer) -> Void`
    
2. Modify the CoolView configuration code to add a double-tap gesture recognizer (an instance of `UITapGestureRecognizer`)
    1. Set the recognizer's' action to the new method added in the previous step.
    2. Adjust the recognizer's tap count.
    3. Add the recognizer to the CoolView.
    4. Add a print statement to `performAnimation(_:)` so you can test the gesture recognizer setup.
3. Add a new method with the following signature:

    `animateMove(size: CGSize) -> Void`
    
    The method should initially contain a print statement for testing puposes.

4. Modify `performAnimation(_:)` to call `animateMove(_:)`, passing a non-zero `CGSize`. In `animateMove(_:)`, use `CGRectOffset` to add the provided size to the frame's origin.
5. 

_TODO: Complete the instructions._