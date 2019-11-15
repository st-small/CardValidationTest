//
//  AppDelegate.swift
//  CardValidationTest
//
//  Created by Станислав Шияновский on 11/15/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?


    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let start = GreetingViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = start
        window?.makeKeyAndVisible()
        
        return true
    }
}

