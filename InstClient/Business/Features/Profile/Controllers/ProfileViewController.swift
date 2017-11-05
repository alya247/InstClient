//
//  ProfileViewController.swift
//  InstClient
//
//  Created by Alya Filon on 05.09.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
   
    //MARK: - IBOutlets
    
    @IBOutlet var profileCollectionView: UICollectionView!
    @IBOutlet var backgroundView: BackgroundMain!
    @IBOutlet var placeholderView: PlaceholderView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    fileprivate let profilePresenter = ProfilePresenter()
    var userModel = User()
    var media = [Media]()

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileLayout.registerCells(for: profileCollectionView)
        profilePresenter.attachView(self)
        getData()
    }
    
    //MARK: - Actions
    
    @IBAction func openSettings(_ sender: UIBarButtonItem) {
        
        // settings functional
    }
    
    // MARK: - API
    
    func getData() {
        profilePresenter.getUserData()
        profilePresenter.getMedia()
    }
}

//MARK: - ProfileView

extension ProfileViewController: ProfileView {
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func finishLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    func setEmptyData() {
        
    }
    
    func setUserData(_ user: User) {
        
        userModel = user
        profileCollectionView.reloadData()
    }
    
    func setMedia(_ media: [Media]) {
        self.media = media
        profileCollectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ProfileLayout.numberOfItems(inSection: section, media: media)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ProfileLayout.cell(forItemAt: indexPath, in: collectionView, with: userModel, media: media)
        
        if let navigationCell = cell as? ProfileNavigationCollectionViewCell {
            navigationCell.delegate = self
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return ProfileLayout.size(forItemAt: indexPath, width: 375, media: media)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return ProfileLayout.insets(forSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return ProfileLayout.minimumLineSpacing(forSection: section)
    }
}

//MARK: - PhotoPresentationProtocol

extension ProfileViewController: PhotoPresentationProtocol {
    
    func changePhotoPresentation(forState state: PhotoState) {
        
        ProfileLayout.setPhotoPresentationState(to: state)
        profileCollectionView.reloadData()
    }
}







