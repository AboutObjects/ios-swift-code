// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

enum OpacityLevel: CGFloat
{
    case Normal = 1.0
    case Highlighted = 0.5
    
    func alpha() -> CGFloat {
        return rawValue
    }
}


class CoolView: UIView
{
    var highlighted: Bool = false {
        willSet { alpha = (newValue ? OpacityLevel.Highlighted.alpha() :
            OpacityLevel.Normal.alpha())
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        highlighted = true
        superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        if let touch = touches.first as? UITouch {
            let currLocation = touch.locationInView(self)
            let prevLocation = touch.previousLocationInView(self)
            
            frame = frame.rectByOffsetting(
                dx: currLocation.x - prevLocation.x,
                dy: currLocation.y - prevLocation.y)
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        highlighted = false
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!)
    {
        highlighted = false
    }
}