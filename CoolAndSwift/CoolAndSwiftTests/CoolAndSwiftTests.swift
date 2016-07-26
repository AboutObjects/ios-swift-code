// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit
import XCTest

class CoolAndSwiftTests: XCTestCase
{
    func testColorAtIndexWithInvalidIndex()
    {
        // TODO: Implement me!
        
        // Alas, apparently this isn't available yet in Swift 1.2...
        // XCTAssertThrows(colorAtIndex(99), "")
    }
    
    func testColorAtIndex()
    {
        let color = UIColor.cellColor(atIndex:0)
        let expectedColor = UIColor.cellColors[UIColor.cellColorTitles[0]] // colorChoices[colorTitles[0]]
        XCTAssertEqual(color!, expectedColor!, "")
    }
}
