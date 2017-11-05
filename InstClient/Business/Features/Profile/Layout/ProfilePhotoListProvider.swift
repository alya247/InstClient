//
//  ProfilePhotoListProvider.swift
//  InstClient
//
//  Created by Alya Filon on 25.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfilePhotoListProvider: ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profilePhotoListCell.identifier, for: indexPath) as! ProfilePhotoListCollectionViewCell
        cell.fill(withMedia: media[indexPath.row])
        
        return cell
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media]) -> CGSize {
        
        return ProfilePhotoListCollectionViewCell.size(withMedia: media[indexPath.row])
    }
}
