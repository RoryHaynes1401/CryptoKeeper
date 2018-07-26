//
//  Currency.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 24/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation

import UIKit

class Currency {  //blueprint for the currency data class
    
    
    let currencyCode : String
    let currencySymbol : String
    let currencyFlag : UIImage
    
    init(code: String, symbol: String, flag: UIImage){
        currencyCode = code
        
        currencySymbol = symbol
        
        currencyFlag = flag
    }
    
    
    
    
}
