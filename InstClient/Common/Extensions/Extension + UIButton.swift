//
//  Extension + UIButton.swift
//  InstClient
//
//  Created by Alya Filon on 30.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

extension UIButton {
    
    func borderGradient(withFrame frame: CGRect) {
        let layer = CAGradientLayer()
        layer.frame = frame
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        let startColor = ProfileTheme.placeholderOrange.cgColor
        let endColor = ProfileTheme.placeholderBlue.cgColor
        layer.colors = [startColor, endColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = UIBezierPath(rect: self.bounds).cgPath
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.clear.cgColor
        layer.mask = shape
        
        self.layer.insertSublayer(layer, at: 0)
    }
}
