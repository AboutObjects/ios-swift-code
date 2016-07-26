// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

struct Opacity {
    static let normal: CGFloat = 1.0
    static let highlighted: CGFloat = 0.5
}

struct TextInset {
    static let left: CGFloat = 12
    static let top: CGFloat = 8
    static let right: CGFloat = 12
    static let bottom: CGFloat = 6
    static let width = left + right
    static let height = right + bottom
    static let origin = CGPoint(x: left, y: top)
}

let textAttributes: [String: AnyObject] = [
    NSFontAttributeName: UIFont.boldSystemFontOfSize(18.0),
    NSForegroundColorAttributeName: UIColor.whiteColor()
]


// MARK: - CoolViewCell
class CoolViewCell: UIView
{
    // MARK: Properties
    var text: String? = "Default Text" {
        didSet { setNeedsDisplay(); sizeToFit() }
    }
    
    var highlighted: Bool = false {
        willSet { alpha = (newValue ? Opacity.highlighted : Opacity.normal) }
    }
    
    var selected: Bool = false {
        willSet { self.highlighted = newValue }
    }

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    convenience init(text: String, color: UIColor = UIColor.blueColor()) {
        self.init(frame: CGRectZero)
        self.backgroundColor = color
        self.text = text
        self.sizeToFit()
    }
}

// MARK: - Configuring Instances
extension CoolViewCell
{
    private func configure() {
        self.configureLayer()
        self.configureGestureRecognizers()
    }
    
    private func configureLayer() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
}

// MARK: - UIResponder Event Phase Methods
extension CoolViewCell
{
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        selected = true
        superview?.bringSubviewToFront(self)
        
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch = touches.first else { return }
        let currLocation = touch.locationInView(self)
        let prevLocation = touch.previousLocationInView(self)
        center.x += currLocation.x - prevLocation.x
        center.y += currLocation.y - prevLocation.y
        
        super.touchesMoved(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
    }
}


// MARK: - Drawing and Resizing
extension CoolViewCell
{
    override func sizeThatFits(size: CGSize) -> CGSize {
        guard let text = text else { return CGSizeZero }
        var newSize = text.sizeWithAttributes(textAttributes)
        newSize.width += TextInset.width
        newSize.height += TextInset.height
        return newSize
    }
    
    override func drawRect(rect: CGRect) {
        text?.drawAtPoint(TextInset.origin, withAttributes: textAttributes)
    }
}