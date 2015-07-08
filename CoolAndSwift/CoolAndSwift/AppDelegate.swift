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
        configureAppearance()
        
        return true
    }
}

// MARK: UIAppearance Configuration
extension AppDelegate
{
    private func configureAppearance()
    {
        UITextField.appearance().keyboardAppearance = .Dark
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Party LET", size: 36)!,
            NSForegroundColorAttributeName: UIColor.cas_NavBarTextColor()
        ]
    }
}

// MARK: UIColor
extension UIColor
{
    // NOTE: Objective-C doesn't have formal namespaces, so you must prefix
    // any methods you add to third-party Objective-C framework classes to avoid
    // potential name collisions. (Here, we're using 'cas' as an informal
    // namespace for the CoolAndSwift project.)
    
    static func cas_NavBarTextColor() -> UIColor {
        return UIColor(red: 0.7, green: 0.3, blue: 0.0, alpha: 1.0)
    }
}
