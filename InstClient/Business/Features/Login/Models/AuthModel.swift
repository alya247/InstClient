//
//  AuthModel.swift
//  InstClient
//
//  Created by Alya Filon on 12.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthModel: Mappable {
    
    var accessToken: String?
    var userID: String?
    var username: String?
    var fullName: String?
    var profilePicture: String?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        accessToken     <- map["access_token"]
        userID          <- map["user.id"]
        username        <- map["user.username"]
        fullName        <- map["user.full_name"]
        profilePicture  <- map["user.profile_picture"]
    }
}
