//
//  CurrencyModel.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 24/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation
import UIKit

class CurrencyModel {
    
    var listOfCurrencyInformation = [Currency]() //array of all the information about the Currency class, with curencyCode and flag.
    
    init(){  //all the data for all the currency
        
        let item = Currency(code: "GBP", flag: UIImage(named: "GBP")!) //example of a currenct and flag item being appended
        
        listOfCurrencyInformation.append(item)
        
        listOfCurrencyInformation.append(Currency(code: "USD", flag: UIImage(named: "USD")!)) //single line create and append
        
        
    }
    //TODO:- add currency and flags to listOfCurrencyInformation Array
    //let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"] //array of all the currency abbreviations
    
    
    
}
