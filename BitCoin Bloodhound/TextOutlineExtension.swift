//
//  TextOutlineExtension.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 01/08/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    
    func makeOutLine(){
        let strokeTextAttributes = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : hexStringToUIColor(hex: "#FFD700"),
            NSAttributedStringKey.strokeWidth : -4.0,
            NSAttributedStringKey.font : self.font
            ] as [NSAttributedStringKey : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            
            attributedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
    }
}
