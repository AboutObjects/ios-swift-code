// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewController: UIViewController, UITextFieldDelegate, CoolViewDelegate
{
    // MARK: Outlets
    @IBOutlet weak var coolView: CoolView!
    
    // MARK: UIViewController
    override func viewDidLoad()
    {
        // XXX: Interface Builder doesn't recognize Swift protocols yet, so
        // we have to do this programmatically for now.
        coolView.delegate = self
        
        coolView.addCell("Hello World", color: UIColor.purpleColor(),
            origin: CGPoint(x: 20, y: 100))
        coolView.addCell("The race is to the Swift?!", color: UIColor.orangeColor(),
            origin: CGPoint(x: 60, y: 160))
        coolView.addCell("New, Improved!", color: UIColor.brownColor(),
            origin: CGPoint(x: 80, y: 220))
        
        coolView.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
    }
}

// MARK: - Segues
extension CoolViewController
{
    // MARK: Unwind Segues
    @IBAction func doneEditing(segue: UIStoryboardSegue) { }
    @IBAction func doneAdding(segue: UIStoryboardSegue) { }
    @IBAction func cancelEditing(segue: UIStoryboardSegue) { }
    @IBAction func cancelAdding(segue: UIStoryboardSegue) { }

    @IBAction func deleteSelectedCell(segue: UIStoryboardSegue)
    {
        if let selectedCell = coolView.selectedCell
        {
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel) {
                _ in
            }
            let delete = UIAlertAction(title: "Okay", style: .Destructive) {
                _ in self.coolView.removeCell(selectedCell)
            }
            
            let alert = UIAlertController(title: "Delete", message: nil, // "For realz?",
                preferredStyle: .Alert)
            alert.addAction(delete)
            alert.addAction(cancel)
            
            NSOperationQueue.mainQueue().addOperationWithBlock {
                self.presentViewController(alert, animated: true) { }
            }
        }
    }
    
    // MARK: Transitioning to Another Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let navController: UINavigationController? =
            segue.destinationViewController as? UINavigationController,
            let editController: CoolViewCellController =
            navController?.childViewControllers[0] as? CoolViewCellController
        {
            switch (segue.identifier!)
            {
            case "Add":
                editController.createCellOnCompletion = {
                    self.coolView.addCell("", origin: CGPoint(x: 140, y: 60))
                }
            case "Edit":
                if let cell = coolView.selectedCell {
                    editController.cell = cell
                }
            default:
                print("Unmatched segue identifier \(segue.identifier)")
            }
        }
    }
}

// MARK: - UITextFieldDelegate Protocol Methods
extension CoolViewController
{
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - CoolViewDelegate Protocol Methods
extension CoolViewController
{
    func coolView(coolView: CoolView, didDeselectRowAtIndex index: Int) {
        navigationItem.leftBarButtonItem?.enabled = false
    }
    func coolView(coolView: CoolView, didSelectRowAtIndex index: Int) {
        navigationItem.leftBarButtonItem?.enabled = true
    }
}

// MARK: - UIResponder Methods
extension CoolViewController
{
    // Deselects the currently selected cell when the user taps anywhere
    // on the cool view's background.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        if let touch: UITouch = touches.first
        {
            if !(touch.view is CoolViewCell) {
                if let cell = coolView.selectedCell {
                    coolView.handleSelection(cell: cell)
                }
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) { }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) { }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) { }
}

