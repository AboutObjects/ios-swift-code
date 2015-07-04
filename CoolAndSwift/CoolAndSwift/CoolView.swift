// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

// MARK: - OpacityLevel Enum
enum OpacityLevel: CGFloat {
    case Normal = 1.0
    case Highlighted = 0.5
    func alpha() -> CGFloat {
        return rawValue
    }
}

// MARK: - Padding Struct
struct TextPadding {
    static let Left: CGFloat = 8
    static let Top: CGFloat = 10
    static let Right: CGFloat = 8
    static let Bottom: CGFloat = 12
}

// MARK: - CoolView Class
class CoolView: UIView
{
    // MARK: Properties
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

// MARK: - UIResponder Event Phase Methods
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

// MARK: - UIView Drawing and Resizing
extension CoolView
{
    override func sizeThatFits(size: CGSize) -> CGSize
    {
        var newSize = text.sizeWithAttributes(textAttributes)
        newSize.width += TextPadding.Left + TextPadding.Right
        newSize.height += TextPadding.Top + TextPadding.Bottom
        
        return newSize
    }
    
    override func drawRect(rect: CGRect)
    {
        let origin = CGPoint(x: TextPadding.Left, y: TextPadding.Top)
        text.drawAtPoint(origin, withAttributes: textAttributes)
    }
}