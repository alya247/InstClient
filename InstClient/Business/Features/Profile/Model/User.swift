//
//  User.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var userID: String?
    var username: String?
    var fullName: String?
    var profilePicture: String?
    var bio: String?
    var website: String?
    
    var mediaCount: Int?
    var followsCount: Int?
    var followedByCount: Int?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        userID          <- map["id"]
        username        <- map["username"]
        fullName        <- map["full_name"]
        profilePicture  <- map["profile_picture"]
        bio             <- map["bio"]
        website         <- map["website"]
        mediaCount      <- map["counts.media"]
        followsCount    <- map["counts.follows"]
        followedByCount <- map["counts.followed_by"]
    }
}
