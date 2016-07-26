// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

extension UIColor
{
    @nonobjc static let cellColors: [String: UIColor]  = [
        "Blue":   UIColor.blueColor(),
        "Brown":  UIColor.brownColor(),
        "Gray":   UIColor.grayColor(),
        "Green":  UIColor.greenColor(),
        "Orange": UIColor.orangeColor(),
        "Purple": UIColor.purpleColor()
    ]
    
    @nonobjc static var cellColorTitles: [String] {
        return UIColor.cellColors.keys.sort()
    }
    
    class func cellColor(atIndex index: Int) -> UIColor? {
        assert(index > -1 && index < UIColor.cellColors.count, "Invalid index: \(index)")
        let title = UIColor.cellColorTitles[index]
        return UIColor.cellColors[title]
    }
    
    class func indexOfCellColor(cellColor: UIColor) -> Int? {
        for (key, value) in UIColor.cellColors {
            if value == cellColor { return UIColor.cellColorTitles.indexOf(key) }
        }
        return nil
    }
}
