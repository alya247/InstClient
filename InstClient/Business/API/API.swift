//
//  API.swift
//  InstClient
//
//  Created by Alya Filon on 05.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

class API {
    
    enum OAuthResult {
        case loggedIn(accessToken: String)
        case error
    }
    
    static var apiURl: String {
        return "https://api.instagram.com"
    }
    
    static var clientID: String {
        return "95218b9a173d43a8a9e555cea9f43a11"
    }
    
    static var clientSecret: String {
        return "1a492172b8194a6f900115c73bfece00"
    }
    
    static var redirectURI: String {
        return "http://www.example.com/"
    }
    
    
}
