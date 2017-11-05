//
//  Gradient.swift
//  InstClient
//
//  Created by Alya Filon on 30.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

class BackgroundMain: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundGradient(withFrame: self.bounds)
    }
}

class PlaceholderView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.placeholderViewGradient(withFrame: self.bounds)
    }
}

class FollowButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.borderGradient(withFrame: self.bounds)
    }
}
