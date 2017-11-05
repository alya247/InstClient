//
//  ProfileNavigationCollectionViewCell.swift
//  InstClient
//
//  Created by Alya Filon on 04.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

enum PhotoState {
    case grid
    case list
}

protocol PhotoPresentationProtocol: NSObjectProtocol {
    func changePhotoPresentation(forState state: PhotoState)
}

class ProfileNavigationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var gridButton: UIButton!
    @IBOutlet var listButton: UIButton!
    
    // MARK: - Properties
    
    weak var delegate: PhotoPresentationProtocol?
    var photoState: PhotoState = .grid
    
    // MARK: - Actions
    
    @IBAction func openGridPresentation(_ sender: UIButton) {
        setButtonState(forButton: sender)
        photoState = .grid
        delegate?.changePhotoPresentation(forState: photoState)
    }
    
    @IBAction func openListPresentation(_ sender: UIButton) {
        photoState = .list
        setButtonState(forButton: sender)
        delegate?.changePhotoPresentation(forState: photoState)
    }
}

extension ProfileNavigationCollectionViewCell {
    
    // MARK: - Private Methods
    
    fileprivate func setButtonState(forButton button: UIButton) {
        gridButton.isSelected = gridButton == button
        listButton.isSelected = listButton == button
    }
    
    // MARK: - Public Methods
    
    static func size() -> CGSize {
        return CGSize(width: .screenWidth - 85, height: 61)
    }
}


