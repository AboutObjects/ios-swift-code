// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        var screenRect = UIScreen.mainScreen().bounds
        window = UIWindow(frame: screenRect)
        window?.backgroundColor = UIColor.lightGrayColor()
        window?.makeKeyAndVisible()
        
        let backgroundView = UIView(frame: screenRect)
        window?.addSubview(backgroundView)
        
        let coolView = CoolView(frame: CGRectInset(screenRect, 0, 40))
        coolView.frame = CGRectOffset(coolView.frame, 0, 40)
        backgroundView.addSubview(coolView)
        
        coolView.addCell("Hello World", color: UIColor.purpleColor(),
            origin: CGPoint(x: 20, y: 60))
        coolView.addCell("The race is to the Swift?!", color: UIColor.orangeColor(),
            origin: CGPoint(x: 60, y: 120))
        
        coolView.addCell("New, Improved!", color: UIColor.brownColor())
        
        backgroundView.backgroundColor = UIColor.brownColor()
        coolView.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
    
        return true
    }
}

