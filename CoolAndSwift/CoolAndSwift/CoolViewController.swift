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
    @IBAction func doneEditing(segue: UIStoryboardSegue) {
        // TODO: Save
    }
    @IBAction func doneAdding(segue: UIStoryboardSegue) {
        // TODO: Save
    }
    @IBAction func cancelEditing(segue: UIStoryboardSegue) { }
    @IBAction func cancelAdding(segue: UIStoryboardSegue) { }
    
    @IBAction func deleteSelectedCell(segue: UIStoryboardSegue)
    {
        if let selectedCell = coolView.selectedCell {
            coolView.removeCell(selectedCell)
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
                println("Unmatched segue identifier \(segue.identifier)")
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