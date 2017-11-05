//
//  Extension + UIView.swift
//  InstClient
//
//  Created by Alya Filon on 16.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

extension UIView: DecoratorCompatible {}

extension UIView {
    
    func backgroundGradient(withFrame frame: CGRect) {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        let startColor = UIColor.black.cgColor
        let endColor = UIColor(red: 104/255.0, green: 104/255.0, blue: 104/255.0, alpha: 1).cgColor
        layer.colors = [startColor, endColor]
        self.layer.insertSublayer(layer, at: 0)
    }
    
    func placeholderViewGradient(withFrame frame: CGRect) {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        let startColor = ProfileTheme.placeholderOrange.cgColor
        let endColor = ProfileTheme.placeholderBlue.cgColor
        layer.colors = [startColor, endColor]
        self.layer.insertSublayer(layer, at: 0)
    }
}



