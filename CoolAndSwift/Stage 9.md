# CoolAndSwift Lab Exercise

## Stage 9: Storyboard

Migrate from nib to storyboard. Add separate scenes for adding and deleting
cool views. Add picker views to allow users to select background colors.

1. 

_TODO: Complete the instructions._


## NOTES

### AppDelegate

Delete setup code.

Add UIAppearance configuration for keyboard style and navigation bar title font.


### CoolViewController

* Implement unwind segues and override `prepareForSegue(_:sender:)`.

* Add UIResponder method implementations to deselect the currently selected cell
in response to tapping anywhere on the cool view's background.

### CoolViewCellController

Add picker views to the Add CoolView and Edit CoolView storyboard scenes, and
implement methods of `UIPickerViewDelegate` and `UIPickerViewDataSource` 
protocols needed to allow users to select a background color for the currently
selected cool view instance.


### UIAlertViewController

Show an alert view with 'Cancel' and 'Delete' buttons when the user taps the
'Delete this Cool View' button.
