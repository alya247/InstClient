//
//  ProfileTheme.swift
//  InstClient
//
//  Created by Alya Filon on 02.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct ProfileTheme {
    
    static let cellShadow = {
        return UIColor.black.withAlphaComponent(0.15)
    }()
    
    static let placeholderOrange = {
        return UIColor(red: 253/255.0,
                       green: 147/255.0,
                       blue: 102/255.0,
                       alpha: 1)
    }()

    static let placeholderBlue = {
        return UIColor(red: 119/255.0,
                       green: 185/255.0,
                       blue: 248/255.0,
                       alpha: 1)
    }()

    static let attributesButtonNumber = {
        return [NSAttributedStringKey.font: R.font.montserratBold(size: 13.0)!,
                NSAttributedStringKey.foregroundColor: UIColor.black]
    }()
    
    static let attributesButtonWords = {
        return [NSAttributedStringKey.font: R.font.montserratRegular(size: 10.0)!,
                NSAttributedStringKey.foregroundColor: UIColor.gray]
    }()
        
    static let fullNameFont = {
        return [NSAttributedStringKey.foregroundColor: UIColor.black,
                NSAttributedStringKey.font: R.font.montserratBold(size: 20.0)!]
    }()
}
