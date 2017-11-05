//
//  AppNavigator.swift
//  InstClient
//
//  Created by Alya Filon on 12.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class AppNavigator {
    
    func setupRootViewController(in window: UIWindow?) {
                
        if UserSession.shared.isActive {
            window?.rootViewController = R.storyboard.profile.instantiateInitialViewController()
            
        } else {
            window?.rootViewController = R.storyboard.login.instantiateInitialViewController()
        }
        
        window?.makeKeyAndVisible()
    }
}
