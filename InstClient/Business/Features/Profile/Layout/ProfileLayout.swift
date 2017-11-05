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
        case .userInfo: return 1
        case .navigation: return 1
        case .photos: return 0
        }
    }
    
    static var photoPresentationState: PhotoState = .grid
    
    private var cellProvider: ProfileCellProvider {
        switch self {
        case .userInfo: return ProfileUserInfoCellProvider()
        case .navigation: return ProfileNavigationProvider()
        case .photos:
            return  Section.photoPresentationState == .grid ? ProfilePhotoGridProvider() : ProfilePhotoListProvider()
        }
    }
    
    func insets() -> UIEdgeInsets {
        switch self {
        case .userInfo: return UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 55)
        case .navigation: return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 55)
        case .photos:
            if Section.photoPresentationState == .grid {
                return UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
            } else {
                return UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 55)
            }
        }
    }
    
    func minimumLineSpacing() -> CGFloat {
        switch self {
        case .photos:
            return Section.photoPresentationState == .grid ? 1 : 20
        default: return 0
        }
    }
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell {
        return cellProvider.cell(forItemAt: indexPath, in: collectionView, with: userModel, media: media)
    }
    
    func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media]) -> CGSize {
        return cellProvider.size(forItemAt: indexPath, width: 0, media: media)
    }
}

struct ProfileLayout {
    
    static func setPhotoPresentationState(to state: PhotoState) {
        Section.photoPresentationState = state
    }
    
    static func registerCells(for collectionView: UICollectionView) {
        collectionView.register(R.nib.profileUserPhotoCell)
        collectionView.register(R.nib.profileNavigationCell)
        collectionView.register(R.nib.profilePhotoGridCell)
        collectionView.register(R.nib.profilePhotoListCell)
    }
    
    static func numberOfItems(inSection section: Int, media: [Media]) -> Int {
        
        guard let section = Section(rawValue: section) else { return 0 }
        
        switch section {
        case .userInfo: return 1
        case .navigation: return 1
        case .photos: return media.count
        }
    }
    
    static func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell {
     
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        return section.cell(forItemAt: indexPath, in: collectionView, with: userModel, media: media)
    }
    
    static func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media])  -> CGSize {
    
        guard let section = Section(rawValue: indexPath.section) else { return .zero }
        return section.size(forItemAt: indexPath, width: 0, media: media)
    }
    
    static func insets(forSection section: Int) -> UIEdgeInsets {
        
        guard let section = Section(rawValue: section) else { return .zero }
        return section.insets()
    }
    
    static func minimumLineSpacing(forSection section: Int) -> CGFloat {
        
        guard let section = Section(rawValue: section) else { return 0 }
        return section.minimumLineSpacing()
    }
}

protocol ProfileCellProvider {
    
    func cell(forItemAt indexPath: IndexPath, in collectionView: UICollectionView, with userModel: User, media: [Media]) -> UICollectionViewCell
    func size(forItemAt indexPath: IndexPath, width: CGFloat, media: [Media]) -> CGSize
}
