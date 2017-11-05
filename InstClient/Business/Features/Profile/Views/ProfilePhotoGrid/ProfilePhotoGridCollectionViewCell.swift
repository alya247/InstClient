//
//  ProfilePhotoGridCollectionViewCell.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class ProfilePhotoGridCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
        
    @IBOutlet var photoImageView: UIImageView!
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
}

//MARK: - Public Methods

extension ProfilePhotoGridCollectionViewCell {
    
    func fill(withMedia media: Media) {
        photoImageView.sd_setImage(with: URL(string: media.imageThumbnail?.url ?? ""))
    }
    
    static func size() -> CGSize {
        let side: CGFloat = .screenWidth / 3 - 3
        return CGSize(width: side, height: side)
    }
}





