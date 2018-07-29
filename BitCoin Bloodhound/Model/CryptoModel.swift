//
//  CryptoModel.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 27/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation
import UIKit

class CryptoModel {
    
    var listOfCryptoCurrency = [Crypto]() //array of an instance of all the information about the Currency class, with curencyCode and flag.
    
    init(){  //all the data for all the currency
        
        listOfCryptoCurrency.append(Crypto(code: "BTC", image: UIImage(named: "BTC")!))
            
        listOfCryptoCurrency.append(Crypto(code: "LTC", image: UIImage(named: "LTC")!))
        // listOfCryptoCurrency.append(Crypto(code: "LTC", image: "LTC")
        
        //TODO:- Add crypto images
         //TODO:- Add other cypto currencies images
    }

}
        
        //listOfCurrencyInformation.append(Currency(code: "AUD", symbol: "$", flag: UIImage(named: "AUD")!)) //create and append currency code and flag to the Currency array
