// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewController: UIViewController, UITextFieldDelegate
{
    // MARK: Outlets
    @IBOutlet weak var coolView: CoolView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: UIViewController
    override func viewDidLoad()
    {
        coolView?.addCell("Hello World", color: UIColor.purpleColor(),
            origin: CGPoint(x: 20, y: 60))
        coolView?.addCell("The race is to the Swift?!", color: UIColor.orangeColor(),
            origin: CGPoint(x: 60, y: 120))
        coolView?.addCell("New, Improved!", color: UIColor.brownColor())
        
        coolView?.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
    }
}

// MARK: - Actions
extension CoolViewController
{
    @IBAction func addCell()
    {
        coolView.addCell(textField.text)
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
