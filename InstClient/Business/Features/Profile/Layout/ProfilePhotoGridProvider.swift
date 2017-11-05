//
//  ProfilePhotoGridProvider.swift
//  InstClient
//
//  Created by Alya Filon on 17.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfilePhotoGridProvider: ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profilePhotoGridCell.identifier, for: indexPath) as! ProfilePhotoGridCollectionViewCell
        cell.fill(withMedia: media[indexPath.row])
        
        return cell
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media]) -> CGSize {
        
        return ProfilePhotoGridCollectionViewCell.size()
    }
}
