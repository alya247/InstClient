//
//  ProfileAPI.swift
//  InstClient
//
//  Created by Alya Filon on 12.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ProfileAPI {
    
    enum Route {

        case owner
        case user(userID: String)
        case ownerMedia
        case userMedia(userID: String)

        var method: HTTPMethod {
            switch self {
            case .owner, .user, .ownerMedia, .userMedia: return .get
            }
        }

        var path: String {
            switch self {
            case .owner:
                return API.apiURL + "/v1/users/self/?access_token=" + UserSession.shared.accessToken!
            case .user(let userID):
                return API.apiURL + "/v1/users/" + userID + "/?access_token=" + UserSession.shared.accessToken!
            case .ownerMedia:
                return API.apiURL + "/v1/users/self/media/recent/?access_token="
                    + UserSession.shared.accessToken!
            case .userMedia(let userID):
                return API.apiURL + "/v1/users/" + userID + "/media/recent/?access_token="
                    + UserSession.shared.accessToken!
            }
        }
    }

    static func getOwnerData(closure: @escaping (_ handler: User?) -> Void) {

        let request = Route.owner
        Alamofire.request(request.path).responseJSON { response in
            switch response.result {
            case .success(let json):
                let user = Mapper<User>().map(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(user)
            case .failure:
                closure(nil)
            }
        }
    }

    static func getUserData(withUserID userID: String, closure: @escaping (_ handler: User?) -> Void) {

        let request = Route.user(userID: userID)
        Alamofire.request(request.path).responseJSON { response in
            switch response.result {
            case .success(let json):
                let user = Mapper<User>().map(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(user)
            case .failure:
                closure(nil)
            }
        }
    }

    static func getOwnerMedia(closure: @escaping (_ handler: [Media]?) -> Void) {

        let request = Route.ownerMedia

        Alamofire.request(request.path).responseJSON { response in
            switch response.result {
            case .success(let json):
                let media = Mapper<Media>().mapArray(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(media)
            case .failure:
                closure([])
            }
        }
    }
    
    static func getUserMedia(withUserID userID: String, closure: @escaping (_ handler: [Media]?) -> Void) {

        let request = Route.userMedia(userID: userID)

        Alamofire.request(request.path).responseJSON { response in
            switch response.result {
            case .success(let json):
                let media = Mapper<Media>().mapArray(JSONObject: (json as AnyObject).value(forKey: "data"))
                closure(media)
            case .failure:
                closure([])
            }
        }
    }
}
