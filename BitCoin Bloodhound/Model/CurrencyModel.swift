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
        
        
        listOfCurrencyInformation.append(Currency(code: "AUD", symbol: "$", flag: UIImage(named: "AUD")!)) //create and append currency code and flag to the Currency array
        listOfCurrencyInformation.append(Currency(code: "BRL", symbol: "R$", flag: UIImage(named: "BRL")!))
        listOfCurrencyInformation.append(Currency(code: "CAD", symbol: "$", flag: UIImage(named: "CAD")!))
        listOfCurrencyInformation.append(Currency(code: "CNY", symbol: "¥", flag: UIImage(named: "CNY")!))
        listOfCurrencyInformation.append(Currency(code: "EUR", symbol: "€", flag: UIImage(named: "EUR")!))
        listOfCurrencyInformation.append(Currency(code: "GBP", symbol: "£", flag: UIImage(named: "GBP")!))
        listOfCurrencyInformation.append(Currency(code: "HKD", symbol: "$", flag: UIImage(named: "HKD")!))
        listOfCurrencyInformation.append(Currency(code: "IDR", symbol: "Rp", flag: UIImage(named: "IDR")!))
        listOfCurrencyInformation.append(Currency(code: "ILS", symbol: "₪", flag: UIImage(named: "ILS")!))
        listOfCurrencyInformation.append(Currency(code: "INR", symbol: "₹", flag: UIImage(named: "INR")!))
        listOfCurrencyInformation.append(Currency(code: "JPY", symbol: "¥", flag: UIImage(named: "JPY")!))
        listOfCurrencyInformation.append(Currency(code: "MXN", symbol: "$", flag: UIImage(named: "MXN")!))
        listOfCurrencyInformation.append(Currency(code: "NOK", symbol: "kr", flag: UIImage(named: "NOK")!))
        listOfCurrencyInformation.append(Currency(code: "NZD", symbol: "$", flag: UIImage(named: "NZD")!))
        listOfCurrencyInformation.append(Currency(code: "PLN", symbol: "zł", flag: UIImage(named: "PLN")!))
        listOfCurrencyInformation.append(Currency(code: "RON", symbol: "lei", flag: UIImage(named: "RON")!))
        listOfCurrencyInformation.append(Currency(code: "RUB", symbol: "₽", flag: UIImage(named: "RUB")!))
        listOfCurrencyInformation.append(Currency(code: "SEK", symbol: "kr", flag: UIImage(named: "SEK")!))
        listOfCurrencyInformation.append(Currency(code: "SGD", symbol: "$", flag: UIImage(named: "SGD")!))
        listOfCurrencyInformation.append(Currency(code: "USD", symbol: "$", flag: UIImage(named: "USD")!))
        listOfCurrencyInformation.append(Currency(code: "ZAR", symbol: "R", flag: UIImage(named: "ZAR")!))
        
        //TODO:- check API for more supported currencies
        
       
        
        
    }
    
    
    
    
}
