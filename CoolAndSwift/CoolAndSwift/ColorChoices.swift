// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

let colorChoices = [
    "Blue":   UIColor.blueColor(),
    "Brown":  UIColor.brownColor(),
    "Gray":   UIColor.grayColor(),
    "Green":  UIColor.greenColor(),
    "Orange": UIColor.orangeColor(),
    "Purple": UIColor.purpleColor()
]

let colorTitles = sorted(colorChoices.keys)

func indexOfTitle(title: String) -> Int?
{
    return find(colorTitles, title)
}

func colorAtIndex(index: Int) -> UIColor?
{
    assert(index > -1 && index < colorChoices.count, "Invalid index: \(index)")
    
    let title = colorTitles[index]
    return colorChoices[title]
}

func indexOfColor(color: UIColor) -> Int?
{
    for (key, value) in colorChoices {
        if value == color {
            return find(colorTitles, key)
        }
    }
    return nil
}

