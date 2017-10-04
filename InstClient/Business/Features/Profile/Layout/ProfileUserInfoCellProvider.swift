//
//  UserInfoCellProvider.swift
//  InstClient
//
//  Created by Alya Filon on 28.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfileUserInfoCellProvider: ProfileCellProvider {
    
    enum Row: Int {
        
        case photo
        case info
        
        static let count = 2
    }
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with model: String) -> UICollectionViewCell {
        
        let row = Row(rawValue: indexPath.row)!
        
        switch row {
        case .photo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileUserPhotoCell.identifier, for: indexPath) as! ProfileUserPhotoCollectionViewCell
            return cell
        case .info:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileUserInfoCell.identifier, for: indexPath) as! ProfileUserInfoCollectionViewCell
            return cell
        }
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat) -> CGSize {
        
        let row = Row(rawValue: indexPath.row)!
        
        switch row {
        case .photo: return ProfileUserPhotoCollectionViewCell.size()
        case .info: return ProfileUserInfoCollectionViewCell.size()
        }
    }
}
