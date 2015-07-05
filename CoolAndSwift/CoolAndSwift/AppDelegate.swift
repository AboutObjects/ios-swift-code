// Copyright (C) 2014 About Objects, Inc. All Rights Reserved.
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
        
        let view1 = CoolViewCell(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        let view2 = CoolViewCell(frame: CGRect(x: 60, y: 100, width: 80, height: 30))
        
        backgroundView.addSubview(view1)
        backgroundView.addSubview(view2)
        
        view1.text = "Hello world!"
        view2.text = "The race is to the Swift?!"
        view1.sizeToFit()
        view2.sizeToFit()

        backgroundView.backgroundColor = UIColor.brownColor()
        view1.backgroundColor = UIColor.purpleColor()
        view2.backgroundColor = UIColor.orangeColor()
    
        return true
    }
}

