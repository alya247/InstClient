//
//  AppDelegate.swift
//  InstClient
//
//  Created by Alya Filon on 05.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppNavigator().setupRootViewController(in: window)
        
        return true
    }
}

