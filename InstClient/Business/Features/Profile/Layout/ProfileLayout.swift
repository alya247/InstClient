//
//  ProfileLayout.swift
//  InstClient
//
//  Created by Alya Filon on 28.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

private enum Section: Int, ProfileCellProvider {
    
    case userInfo = 0
    case navigation
    case photos
    
    var rowsCount: Int {
        switch self {
        case .userInfo: return 2
        case .navigation: return 1
        case .photos: return 20
        }
    }
    
    private var cellProvider: ProfileCellProvider {
        switch self {
        case .userInfo: return ProfileUserInfoCellProvider()
        case .navigation: return ProfileNavigationProvider()
        case .photos: return ProfileUserInfoCellProvider()
        }
        
    }
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with model: String) -> UICollectionViewCell {
        return cellProvider.cell(forItemAt: indexPath, in: collectionView, with: model)
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat) -> CGSize {
        return cellProvider.size(forItemAt: indexPath, width: 0)
    }
}

struct ProfileLayout {
    
    static func registerCells(for collectionView: UICollectionView) {
        collectionView.register(R.nib.profileUserPhotoCell)
        collectionView.register(R.nib.profileUserInfoCell)
        collectionView.register(R.nib.profileNavigationCell)
        collectionView.register(R.nib.profilePhotoGridCell)
        collectionView.register(R.nib.profilePhotoListCell)
    }
    
    static func numberOfItems(inSection section: Int) -> Int {
        
        guard let section = Section(rawValue: section) else { return 0 }
        
        switch section {
        case .userInfo: return ProfileUserInfoCellProvider.Row.count
        case .navigation: return 1
        case .photos: return 0
        }
    }
    
    static func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with model: String) -> UICollectionViewCell {
     
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        return section.cell(forItemAt: indexPath, in: collectionView, with: "")
    }
    
    static func size(forItemAt indexPath: IndexPath, width: CGFloat)  -> CGSize {
    
        guard let section = Section(rawValue: indexPath.section) else { return .zero }
        
        return section.size(forItemAt: indexPath, width: 0)
    }
}

protocol ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with model: String) -> UICollectionViewCell
    func size(forItemAt indexPath: IndexPath, width: CGFloat) -> CGSize
}
