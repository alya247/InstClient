//
//  AuthAPI.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AuthAPI {
    
    enum AuthResult {
        case loggedIn(accessToken: String)
        case error
    }
    
    enum Route {
        case authCode
        case accessToken(code: String)
        
        var method: HTTPMethod {
            switch self {
            case .authCode: return .get
            case .accessToken: return .post
            }
        }
        
        var path: String {
            switch self {
            case .authCode:
                return API.apiURL + "/oauth/authorize/?client_id=" + API.clientID + "&redirect_uri=" + API.redirectURI + "&response_type=code&scope=" + LoginPermissions.allLoginPermissions()
                
            case .accessToken:
                return API.apiURL + "/oauth/access_token"
            }
        }
        
        var parameters: [String: Any]? {
            
            switch self {
            case .authCode:
                return nil
                
            case .accessToken(let code):
                let params = ["client_id":      API.clientID,
                              "client_secret":  API.clientSecret,
                              "grant_type":     "authorization_code",
                              "redirect_uri":   API.redirectURI,
                              "code":           code] as [String : Any]
                return params
            }
        }
    }
    
    static func codeRequest() -> URL? {
        return URL(string: Route.authCode.path)
    }
    
    static func accessTokenRequest(code: String, closure: @escaping (_ handler: AuthModel?) -> Void)   {
        
        let request = Route.accessToken(code: code)
        
        Alamofire.request(request.path, method: request.method, parameters: request.parameters).responseJSON { response in
            
            switch response.result {
            case .success(let json):
                let auth = Mapper<AuthModel>().map(JSONObject: json)
                closure(auth)
            case .failure:
                closure(nil)
            }
        }
    }
}
