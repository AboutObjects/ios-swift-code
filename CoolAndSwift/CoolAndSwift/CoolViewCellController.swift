// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewCellController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    var cell: CoolViewCell!
    var selectedColorTitle: String? = nil
    var createCellOnCompletion: (() -> CoolViewCell)?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewWillAppear(animated: Bool)
    {
        if cell != nil {
            if let color = cell.backgroundColor, let row = indexOfColor(color) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
            }
            textField.text = cell.text
        }
        
        textField.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let identifier = segue.identifier where identifier == "Done"
        {
            if let newCell = createCellOnCompletion {
                cell = newCell()
            }
            
            if let color = colorAtIndex(pickerView.selectedRowInComponent(0)) {
                cell.backgroundColor = color
            }
            cell.text = textField.text
        }
    }
}

// MARK: - UIPickerViewDataSource
extension CoolViewCellController
{
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return colorChoices.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
}


// MARK: - UIPickerViewDelegate
extension CoolViewCellController
{
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return colorTitles[row]
    }
}

