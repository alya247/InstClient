//
//  UserSession.swift
//  InstClient
//
//  Created by Alya Filon on 12.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation
import KeychainAccess

class UserSession {

    static let shared = UserSession()

    var onActivation: (() -> ())?
    var onDeactivation: (() -> ())?

    fileprivate struct Keys {
        static let accessTokenKey = "access_token"
        static let isAuthorizeKey = "authorize"
        static let userID = "user_id"
        static let username = "username"
        static let userPhoto = "user_photo"
    }

    fileprivate let defaults = UserDefaults.standard
    fileprivate let keychain = Keychain(service: Bundle.main.bundleIdentifier!)

    var accessToken: String? {
        return keychain[Keys.accessTokenKey]
    }
    
    var userID: String? {
        return keychain[Keys.userID]
    }
    
    var username: String? {
        return keychain[Keys.username]
    }
    
    var userPhoto: String? {
        return keychain[Keys.userPhoto]
    }

    fileprivate var authorized: Bool {
        return defaults.bool(forKey: Keys.isAuthorizeKey)
    }

    var isActive: Bool {
        return authorized && accessToken != nil
    }

    func activate(with accessToken: String) throws {

        do {
            try keychain
                .accessibility(.always)
                .synchronizable(false)
                .set(accessToken, key: Keys.accessTokenKey)
            defaults.set(true, forKey: Keys.isAuthorizeKey)

        } catch let error {
            throw error
        }

        DispatchQueue.main.async { [unowned self] in
            self.onActivation?()
        }
    }

    func deactivate() throws {

        do {
            try keychain.remove(Keys.accessTokenKey)
            defaults.set(false, forKey: Keys.isAuthorizeKey)

            DispatchQueue.main.async { [unowned self] in
                self.onDeactivation?()
            }
        } catch let error {
            throw error
        }
    }
    
    func set(_ user: AuthModel) {
        
        keychain[Keys.userID] = user.userID
        keychain[Keys.username] = user.username
        keychain[Keys.userPhoto] = user.profilePicture
    }
    
    func deleteUser() {
        keychain[Keys.userID] = nil
        keychain[Keys.username] = nil
        keychain[Keys.userPhoto] = nil
    }
}

