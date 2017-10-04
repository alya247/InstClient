//
//  ProfileNavigationProvider.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfileNavigationProvider: ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with model: String) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileNavigationCell.identifier, for: indexPath) as! ProfileNavigationCollectionViewCell
        return cell
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat) -> CGSize {
        
        return ProfileUserInfoCollectionViewCell.size()
    }
}
