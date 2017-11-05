//
//  ProfilePresenter.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import Foundation

protocol ProfileView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUserData(_ user: User)
    func setMedia(_ media: [Media])
    func setEmptyData()
}

class ProfilePresenter {
    
    fileprivate let profileService: ProfileService
    weak fileprivate var profileView: ProfileView?
    
    init(profileService: ProfileService = ProfileService()) {
        self.profileService = profileService
    }
    
    func attachView(_ view: ProfileView) {
        profileView = view
    }
    
    func getUserData(withUserID userID: String? = nil) {
        profileView?.startLoading()
        profileService.getUserData(withUserID: userID) { [weak self] user in
            self?.profileView?.finishLoading()
            if user != nil {
                self?.profileView?.setUserData(user!)
            } else {
                self?.profileView?.setEmptyData()
            }
        }
    }
    
    func getMedia(withUserID userID: String? = nil) {
        profileView?.startLoading()
        profileService.getUserMedia(withUserID: userID) { [weak self] media in
            self?.profileView?.finishLoading()
            if media != nil &&
                !(media?.isEmpty ?? true) {
                self?.profileView?.setMedia(media!)
            } else {
                self?.profileView?.setEmptyData()
            }
        }
    }
}
