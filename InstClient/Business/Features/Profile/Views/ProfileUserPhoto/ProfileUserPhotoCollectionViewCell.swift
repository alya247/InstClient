//
//  ProfileUserPhotoCollectionViewCell.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileUserPhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var userPhotoImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var followButton: FollowButton!
    @IBOutlet var postsButton: UIButton!
    @IBOutlet var followersButton: UIButton!
    @IBOutlet var followingButton: UIButton!
    
    enum MediaButtons {
        
        case posts
        case followers
        case following
        
        var name: String {
            switch self {
            case .posts: return "POSTS   "
            case .followers: return "FOLLOWERS "
            case .following: return "FOLLOWING"
            }
        }
        
        func value(forUser user: User) -> String {
            switch self {
            case .posts:
                return String(user.mediaCount ?? 0)
            case .followers:
                return String(user.followedByCount ?? 0)
            case .following:
                return String(user.followsCount ?? 0)
            }
        }
    }
    
    var model: User?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.decorator.apply(Style.shadow(opacity: 25, offset: CGSize(width: 0, height: 25), color: ProfileTheme.cellShadow))
    }
}

// MARK: - Public Methods

extension ProfileUserPhotoCollectionViewCell {
    
    func fill(withModel model: User) {
        self.model = model
        
        usernameLabel.text = "@\(model.username ?? "")"
        fullNameLabel.text = model.fullName
        userPhotoImageView.sd_setImage(with: URL(string: model.profilePicture ?? ""))
        
        let buttonText = UserSession.shared.userID == model.userID ? "EDIT" : "FOLLOW"
        followButton.setTitle(buttonText, for: .normal)
        
        configure(postsButton, state: .posts)
        configure(followersButton, state: .followers)
        configure(followingButton, state: .following)
    }
    
    func configure(_ button: UIButton, state: MediaButtons) {
        
        guard model != nil else { return }
        let text = state.name.makeAttributedString(withAttributes: ProfileTheme.attributesButtonWords)
        text.append(state.value(forUser: model!).makeAttributedString(withAttributes: ProfileTheme.attributesButtonNumber))
        button.titleLabel?.textAlignment = .center
        button.setAttributedTitle(text, for: .normal)
    }
    
    static func size() -> CGSize {
        return CGSize(width: .screenWidth - 85, height: 420)
    }
}
