// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

let BounceSize = CGSize(width: 120, height: 240)

// MARK: - Additional UIView Configuration
extension CoolViewCell
{
    /// Adds a double-tap gesture recognizer that triggers calls to `performAnimation(_:)`
    func configureGestureRecognizers()
    {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("performAnimation:"))
        tapRecognizer.numberOfTapsRequired = 2
        tapRecognizer.delaysTouchesEnded = false
        
        self.addGestureRecognizer(tapRecognizer)
    }
}

// MARK: - UIView Animation
extension CoolViewCell
{
    func performAnimation(gestureRecognizer: UISwipeGestureRecognizer)
    {
        animateBounce(1.0, size: BounceSize) {
            UIView.setAnimationRepeatCount(3.5)
            UIView.setAnimationRepeatAutoreverses(true)
        }
        
        // animateSpringyBounce(1.0, size: AnimatedMoveSize)
    }
    
    private func animateBounce(duration: NSTimeInterval, size: CGSize, configuration: () -> Void)
    {
        UIView.animateWithDuration(duration,
            animations: {
                configuration()
                let translation = CGAffineTransformMakeTranslation(size.width, size.height)
                self.transform = CGAffineTransformRotate(translation, CGFloat(M_PI_2))
            },
            completion: { _ in
                self.animateFinalBounce(duration, size: size)
            }
        )
    }
    
    /// Reverts any changes to the view's geometry.
    private func animateFinalBounce(duration: NSTimeInterval, size: CGSize)
    {
        UIView.animateWithDuration(duration, animations: {
            self.transform = CGAffineTransformIdentity
        })
    }
    
    // MARK: Alternate, Spring-Damped Animation
    private func animateSpringyBounce(duration: NSTimeInterval, size: CGSize)
    {
        UIView.animateWithDuration(duration,
            delay: 0.0,
            usingSpringWithDamping: 0.075,
            initialSpringVelocity: 0.075,
            options: .Repeat,
            animations: {
                UIView.setAnimationRepeatCount(3.5)
                let translation = CGAffineTransformMakeTranslation(size.width, size.height)
                self.transform = CGAffineTransformRotate(translation, CGFloat(M_PI_2))
            },
            completion: { _ in
                self.animateFinalBounce(duration, size: size)
        })
    }
}
