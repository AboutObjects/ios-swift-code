// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewController: UIViewController, UITextFieldDelegate
{
    var textField: UITextField?
    var coolView: CoolView?
    
    override func loadView()
    {
        let screenRect = UIScreen.mainScreen().bounds
        let backgroundView = UIView(frame: screenRect)
        self.view = backgroundView
        
        let accessoryRect = CGRect(origin: screenRect.origin, size: CGSize(width: CGRectGetWidth(screenRect), height: 80.0))
        let accessoryView = UIView(frame: accessoryRect)
        backgroundView.addSubview(accessoryView)
        
        // Controls
        
        textField = UITextField(frame: CGRect(x: 8, y: 36, width: 300, height: 30))
        textField?.borderStyle = .RoundedRect
        textField?.placeholder = "Enter some text"
        textField?.delegate = self
        
        let button: UIButton = UIButton.buttonWithType(.System) as! UIButton
        button.setTitle("Add", forState: .Normal)
        button.sizeToFit()
        button.frame = CGRectOffset(button.frame, 316, 36)
        
        button.addTarget(self, action: "addCell", forControlEvents: .TouchUpInside)
        
        accessoryView.addSubview(textField!)
        accessoryView.addSubview(button)
        
        // CoolView and Cells
        
        coolView = CoolView(frame: CGRectInset(screenRect, 0, 40))
        coolView?.frame = CGRectOffset(coolView!.frame, 0, 40)
        backgroundView.addSubview(coolView!)
        
        coolView?.clipsToBounds = true
        
        coolView?.addCell("Hello World", color: UIColor.purpleColor(),
            origin: CGPoint(x: 20, y: 60))
        coolView?.addCell("The race is to the Swift?!", color: UIColor.orangeColor(),
            origin: CGPoint(x: 60, y: 120))
        coolView?.addCell("New, Improved!", color: UIColor.brownColor())
        
        coolView?.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        backgroundView.backgroundColor = UIColor.brownColor()
    }
}

// MARK: - Action Methods
extension CoolViewController
{
    func addCell()
    {
        if let text = textField?.text {
            coolView?.addCell(text)
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
