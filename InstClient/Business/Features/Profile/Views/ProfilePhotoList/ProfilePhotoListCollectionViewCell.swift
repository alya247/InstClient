//
//  ProfilePhotoListCollectionViewCell.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class ProfilePhotoListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var userPhotoImageView: UIImageView!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var commentsLabel: UILabel!
    
    //MARK: - Properties
    
    fileprivate static var imageViewFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var media: Media?
    
    enum MediaLabels {
        
        case likes
        case comments
        
        var name: String {
            switch self {
            case .likes: return " LIKES"
            case .comments: return " COMMENTS"
            }
        }
        
        func value(forMedia media: Media) -> String {
            switch self {
            case .likes:
                return String(media.likes ?? 0)
            case .comments:
                return String(media.comments ?? 0)
            }
        }
    }
        
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.decorator.apply(Style.shadow(opacity: 25, offset: CGSize(width: 0, height: 25), color: ProfileTheme.cellShadow))
        userPhotoImageView.decorator.apply(Style.corners(userPhotoImageView.frame.height / 2))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
}

// MARK: - Public Methods

extension ProfilePhotoListCollectionViewCell {
    
    func fill(withMedia media: Media) {
        
        self.media = media
        userPhotoImageView.sd_setImage(with: URL(string: media.user?.profilePicture ?? ""))
        photoImageView.sd_setImage(with: URL(string: media.imageStandardRes?.url ?? ""))
        configure(likesLabel, state: .likes)
        configure(commentsLabel, state: .comments)
    }
    
    func configure(_ label: UILabel, state: MediaLabels) {
        
        guard media != nil else { return }
        let text = state.value(forMedia: media!).makeAttributedString(withAttributes: ProfileTheme.attributesButtonNumber)
        text.append(state.name.makeAttributedString(withAttributes: ProfileTheme.attributesButtonWords))
        label.attributedText = text
    }
    
    static func size(withMedia media: Media?) -> CGSize {
        
        return CGSize(width: 290, height: 377)
    }
}





