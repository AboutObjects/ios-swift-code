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
        let color = colorAtIndex(0)
        let expectedColor = colorChoices[colorTitles[0]]
        XCTAssertEqual(color!, expectedColor!, "")
    }
}
