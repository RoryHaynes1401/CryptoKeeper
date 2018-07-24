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
        

        
        
        
        listOfCurrencyInformation.append(Currency(code: "AUD", flag: UIImage(named: "GBP")!)) //create and append currency code and flag to the Currency array
        listOfCurrencyInformation.append(Currency(code: "BRL", flag: UIImage(named: "GBP")!))
        listOfCurrencyInformation.append(Currency(code: "CAD", flag: UIImage(named: "GBP")!))
        listOfCurrencyInformation.append(Currency(code: "EUR", flag: UIImage(named: "GBP")!))
        listOfCurrencyInformation.append(Currency(code: "GBP", flag: UIImage(named: "GBP")!))
        
        //TODO:- Add and update flags and images
        //TODO:- Add the rest of the members
        
        listOfCurrencyInformation.append(Currency(code: "USD", flag: UIImage(named: "USD")!))
        
        
    }
    //TODO:- add currency and flags to listOfCurrencyInformation Array
    //let currencyArray = ["HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"] //array of all the currency abbreviations
    
    
    
}
