//
//  Media.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class Media: Mappable {
    
    var id: String?
    var type: String?
    var user: User?
    var usersInMedia = [User]()
    var link: String?
    var likes: Int?
    var createdTime: String?
    var imageThumbnail: Image?
    var imageLowRes: Image?
    var imageStandardRes: Image?
    var comments: Int?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        user                <- map["user"]
        type                <- map["type"]
        usersInMedia        <- map["users_in_photo"]
        link                <- map["link"]
        likes               <- map["likes.count"]
        createdTime         <- map["created_time"]
        imageThumbnail      <- map["images.thumbnail"]
        imageLowRes         <- map["images.low_resolution"]
        imageStandardRes    <- map["images.standard_resolution"]
        comments            <- map["comments.count"]
    }
}
