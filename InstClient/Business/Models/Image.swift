//
//  Image.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import ObjectMapper

class Image: Mappable {
    
    var url: String?
    var width: Int?
    var height: Int?
    
    // Mappable
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        url     <- map["url"]
        width   <- map["width"]
        height  <- map["height"]
    }
}
