//
//  Style.swift
//  InstClient
//
//  Created by Alya Filon on 16.10.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

struct Style {
    
    static func corners(_ round: CGFloat) -> Decoration<UIView> {
        return { [round] (view: UIView) -> Void in
            view.layer.cornerRadius = round
        }
    }
    
    static func borderWidth(_ width: CGFloat) -> Decoration<UIView> {
        return { [width] (view: UIView) -> Void in
            view.layer.borderWidth = width
        }
    }
    
    static func borderColor(_ color: UIColor) -> Decoration<UIView> {
        return { [color] (view: UIView) -> Void in
            view.layer.borderColor = color.cgColor
        }
    }
    
    static func shadow(opacity: Float, offset: CGSize, color: UIColor) -> Decoration<UIView> {
        return { (view: UIView) -> Void in
            view.layer.shadowOpacity = opacity
            view.layer.shadowOffset = offset
            view.layer.shadowColor = color.cgColor
        }
    }
}
