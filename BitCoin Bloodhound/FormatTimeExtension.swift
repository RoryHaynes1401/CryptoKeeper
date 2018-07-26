//
//  FormatTimeExtension.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 25/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension String {
    func dateChange() -> String {
        
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"                 // Note: S is fractional second
        let dateFromString = dateFormatter.date(from: self)        // "Nov 25, 2015, 4:31 AM" as NSDate
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MMM d, HH:mm:ss"
        
        let stringFromDate = dateFormatter2.string(from: dateFromString!) // "Nov
        print(stringFromDate)
        
        return stringFromDate
    }
}





