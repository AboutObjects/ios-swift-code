// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

class CoolViewCellController: UIViewController
{
    var cell: CoolViewCell?
    var selectedColorTitle: String? = nil
    var createCellOnCompletion: (() -> CoolViewCell)?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewWillAppear(animated: Bool)
    {
        textField.text = cell?.text
        textField.becomeFirstResponder()
        selectColor()
    }
    
    func selectColor() {
        guard let cell = cell, color = cell.backgroundColor, row =  UIColor.indexOfCellColor(color) else { return }
        pickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let identifier = segue.identifier where identifier == "Done"
        {
            if createCellOnCompletion != nil {
                cell = createCellOnCompletion?()
            }
            cell?.text = textField.text
            cell?.backgroundColor = UIColor.cellColor(atIndex: pickerView.selectedRowInComponent(0))
        }
    }
}

// MARK: - UIPickerViewDataSource

extension CoolViewCellController: UIPickerViewDataSource
{
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UIColor.cellColors.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}


// MARK: - UIPickerViewDelegate

extension CoolViewCellController: UIPickerViewDelegate
{
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UIColor.cellColorTitles[row]
    }
}

