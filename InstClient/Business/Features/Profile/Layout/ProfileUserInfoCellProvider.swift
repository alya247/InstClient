//
//  UserInfoCellProvider.swift
//  InstClient
//
//  Created by Alya Filon on 28.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfileUserInfoCellProvider: ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileUserPhotoCell.identifier, for: indexPath) as! ProfileUserPhotoCollectionViewCell
        cell.fill(withModel: userModel)
        
        return cell
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media]) -> CGSize {
        
        return ProfileUserPhotoCollectionViewCell.size()
    }
}
