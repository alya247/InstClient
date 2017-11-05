//
//  BaseViewController.swift
//  InstClient
//
//  Created by Alya Filon on 22.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
    }
}

extension BaseViewController {
    
    func setupBackground() {
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .black
    }
    
    func setupAppearance() {
    }
}
