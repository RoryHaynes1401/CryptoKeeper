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
        

        //TODO:- Add currency sign:
        
        
        listOfCurrencyInformation.append(Currency(code: "AUD", flag: UIImage(named: "AUD")!)) //create and append currency code and flag to the Currency array
        listOfCurrencyInformation.append(Currency(code: "BRL", flag: UIImage(named: "BRL")!))
        listOfCurrencyInformation.append(Currency(code: "CAD", flag: UIImage(named: "CAD")!))
        listOfCurrencyInformation.append(Currency(code: "EUR", flag: UIImage(named: "EUR")!))
        listOfCurrencyInformation.append(Currency(code: "GBP", flag: UIImage(named: "GBP")!))
        listOfCurrencyInformation.append(Currency(code: "HKD", flag: UIImage(named: "HKD")!))
        listOfCurrencyInformation.append(Currency(code: "IDR", flag: UIImage(named: "IDR")!))
        listOfCurrencyInformation.append(Currency(code: "ILS", flag: UIImage(named: "ILS")!))
        listOfCurrencyInformation.append(Currency(code: "INR", flag: UIImage(named: "INR")!))
        listOfCurrencyInformation.append(Currency(code: "JPY", flag: UIImage(named: "JPY")!))
        listOfCurrencyInformation.append(Currency(code: "MXN", flag: UIImage(named: "MXN")!))
        listOfCurrencyInformation.append(Currency(code: "NOK", flag: UIImage(named: "NOK")!))
        listOfCurrencyInformation.append(Currency(code: "NZD", flag: UIImage(named: "NZD")!))
        listOfCurrencyInformation.append(Currency(code: "PLN", flag: UIImage(named: "PLN")!))
        listOfCurrencyInformation.append(Currency(code: "RON", flag: UIImage(named: "RON")!))
        listOfCurrencyInformation.append(Currency(code: "RUB", flag: UIImage(named: "RUB")!))
        listOfCurrencyInformation.append(Currency(code: "SEK", flag: UIImage(named: "SEK")!))
        listOfCurrencyInformation.append(Currency(code: "SGD", flag: UIImage(named: "SGD")!))
        listOfCurrencyInformation.append(Currency(code: "USD", flag: UIImage(named: "USD")!))
        listOfCurrencyInformation.append(Currency(code: "ZAR", flag: UIImage(named: "ZAR")!))
        
        //TODO:- check API for more supported currencies
        
        
        
        
    }
    
    
    
    
}
