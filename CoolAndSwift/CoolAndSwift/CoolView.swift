// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

// MARK: OpacityLevel enum
enum OpacityLevel: CGFloat {
    case Normal = 1.0
    case Highlighted = 0.5
    func alpha() -> CGFloat {
        return rawValue
    }
}

// MARK: Padding enum
enum Padding: CGFloat {
    case Width = 12.0
    case Height = 8.0
    func amount() -> CGFloat {
        return rawValue
    }
    func total() -> CGFloat {
        return rawValue * 2.0
    }
}

// MARK: CoolView class
class CoolView: UIView
{
    var text: NSString = "Default Text"
    
    var textAttributes: [NSObject: AnyObject] = [
        NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0),
        NSForegroundColorAttributeName: UIColor.whiteColor()
    ]
    
    var highlighted: Bool = false {
        willSet { alpha = (newValue ? OpacityLevel.Highlighted.alpha() :
            OpacityLevel.Normal.alpha())
        }
    }
}

// MARK: UIResponder event phase method implementations
extension CoolView
{
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

// MARK: Drawing
extension CoolView
{
    override func sizeThatFits(size: CGSize) -> CGSize
    {
        var newSize = text.sizeWithAttributes(textAttributes)
        newSize.width += Padding.Width.total()
        newSize.height += Padding.Height.total()
        
        return newSize
    }
    
    override func drawRect(rect: CGRect)
    {
        let origin = CGPoint(x: Padding.Width.amount(), y: Padding.Height.amount())
        text.drawAtPoint(origin, withAttributes: textAttributes)
    }
}