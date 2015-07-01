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
        
        let view1 = CoolView(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        let view2 = CoolView(frame: CGRect(x: 60, y: 100, width: 80, height: 30))
        
        backgroundView.addSubview(view1)
        backgroundView.addSubview(view2)

        backgroundView.backgroundColor = UIColor.brownColor()
        view1.backgroundColor = UIColor.purpleColor()
        view2.backgroundColor = UIColor.orangeColor()
        
        return true
    }
}

