//
//  LoginPermissions.swift
//  InstClient
//
//  Created by Alya Filon on 25.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

struct LoginPermissions {
    
    enum LoginPermission: Int {
        case basic = 0
        case publicContent
        case followerList
        case comments
        case relationships
        case likes
        
        var value: String {
            switch self {
            case .basic: return "basic"
            case .publicContent: return "public_content"
            case .followerList: return "follower_list"
            case .comments: return "comments"
            case .relationships: return "relationships"
            case .likes: return "likes"
            }
        }
    }
    
    static func allLoginPermissions() -> String {
        
        var loginPermissionsString = ""
        var count = 0
        while let permission = LoginPermission(rawValue: count) {
            loginPermissionsString.append("\(permission.value)+")
            count += 1
        }
        loginPermissionsString.removeLast()
        return loginPermissionsString
    }
}
