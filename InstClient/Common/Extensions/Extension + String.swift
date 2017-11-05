//
//  Extension + String.swift
//  InstClient
//
//  Created by Alya Filon on 02.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

extension String {
    
    func makeAttributedString(withAttributes attributes: [NSAttributedStringKey : Any]) -> NSMutableAttributedString {
        
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}
