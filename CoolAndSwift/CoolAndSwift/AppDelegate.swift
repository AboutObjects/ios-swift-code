// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var controller: CoolViewController?

    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.lightGrayColor()
        window?.makeKeyAndVisible()
        
        controller = CoolViewController(nibName: nil, bundle: nil)
        if let backgroundView = controller?.view {
            window?.addSubview(backgroundView)
        }
    
        return true
    }
}

