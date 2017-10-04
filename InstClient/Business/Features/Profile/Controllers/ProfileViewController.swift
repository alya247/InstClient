//
//  ProfileViewController.swift
//  InstClient
//
//  Created by Alya Filon on 05.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var profileCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileLayout.registerCells(for: profileCollectionView)
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ProfileLayout.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return ProfileLayout.cell(forItemAt: indexPath, in: collectionView, with: "")
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return ProfileLayout.size(forItemAt: indexPath, width: 375)
    }
}
