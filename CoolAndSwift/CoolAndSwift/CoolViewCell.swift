// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
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

// MARK: - CoolViewCell Class
class CoolViewCell: UIView
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
    
    var selected: Bool = false {
        willSet {
            self.highlighted = newValue
        }
    }

    // MARK: Initializers
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    convenience init(text: NSString, color: UIColor = UIColor.blueColor())
    {
        // NOTE: Important to use `self` rather than `super` here.
        self.init(frame: CGRectZero)
        
        self.backgroundColor = color
        self.text = text
        self.sizeToFit()
    }
}

// MARK: - UIView and CALayer Configuration
extension CoolViewCell
{
    private func configure()
    {
        self.configureLayer()
        self.configureGestureRecognizers()
    }
    
    private func configureLayer()
    {
        layer.borderWidth = 3
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 12
        
        layer.masksToBounds = true
    }
}

// MARK: - UIResponder Event Phase Methods
extension CoolViewCell
{
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        selected = true
        superview?.bringSubviewToFront(self)
        
        super.touchesBegan(touches, withEvent: event)
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
        
        super.touchesMoved(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        super.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!)
    {
        super.touchesCancelled(touches, withEvent: event)
    }
}

// MARK: - UIView Drawing and Resizing
extension CoolViewCell
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