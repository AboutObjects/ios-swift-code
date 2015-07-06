// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewController: UIViewController, UITextFieldDelegate, CoolViewDelegate
{
    // MARK: Outlets
    @IBOutlet weak var coolView: CoolView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: UIViewController
    override func viewDidLoad()
    {
        coolView.addCell("Hello World", color: UIColor.purpleColor(),
            origin: CGPoint(x: 20, y: 60))
        coolView.addCell("The race is to the Swift?!", color: UIColor.orangeColor(),
            origin: CGPoint(x: 60, y: 120))
        coolView.addCell("New, Improved!", color: UIColor.brownColor())
        
        coolView.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
    }
}

// MARK: - Actions
extension CoolViewController
{
    @IBAction func addCell()
    {
        coolView.addCell(textField.text)
    }
    
    @IBAction func removeSelectedCell()
    {
        if let selectedCell = coolView.selectedCell {
            coolView.removeCell(selectedCell)
        }
    }
    
    @IBAction func editSelectedCell()
    {
        if let selectedCell = coolView.selectedCell,
            let text = textField.text {
                selectedCell.text = text
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
        textField.text = nil
    }
    func coolView(coolView: CoolView, didSelectRowAtIndex index: Int) {
        let cell = coolView.cellAtIndex(index)
        textField.text = cell.text
    }
}