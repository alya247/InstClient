//
//  ProfileService.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

class ProfileService {
    
    func getUserData(withUserID userID: String? = nil, clousure callback: @escaping (User?) -> Void) {
        
        if let userID = userID {
            ProfileAPI.getUserData(withUserID: userID) { user in
                callback(user)
            }
        } else {
            ProfileAPI.getOwnerData() { user in
                callback(user)
            }
        }
    }
    
    func getUserMedia(withUserID userID: String? = nil, clousure callback: @escaping ([Media]?) -> Void) {
        
        if let userID = userID {
            ProfileAPI.getUserMedia(withUserID: userID) { media in
                callback(media)
            }
        } else {
            ProfileAPI.getOwnerMedia() { media in
                callback(media)
            }
        }
    }
}
