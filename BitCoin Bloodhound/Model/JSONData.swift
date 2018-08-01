//
//  JSONData.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 25/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class JSONData {
    
    var timeStamp : String = ""
    
     var baseCryptoCurrencyDataURL = "https://min-api.cryptocompare.com/data/price?fsym="
     var extensionCrytpoCurrencyType = "BTC"
     var extensionComboURL = "&tsyms="
     var extensionCurrencyCode = "USD,JPY,EUR"
    
    
    
    func getBitCoinData(cryptoType: String, currencyCode: String, completion:@escaping (String, String) -> Void ) { //method requiring a url that fetches data in the form of a JSON
        print("alamofire called")
        var updatedBitCoinPrice : String = ""
        
        let url = baseCryptoCurrencyDataURL+cryptoType+extensionComboURL+currencyCode
        
        print(url)
        
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            if response.result.isSuccess{
                
                print("bitcoincurrency data received successfully")
                
                let bitCoinCurrencyJSON : JSON = JSON(response.result.value!) //force unwrap, as this is only called if a reuslt is found
                print(bitCoinCurrencyJSON)
                updatedBitCoinPrice = self.updateBitCoinPrice(currencyCode: currencyCode, json: bitCoinCurrencyJSON)
                completion (updatedBitCoinPrice, self.updateBitCoinTime())
                
            }
            else if response.result.isFailure {
                
                print("Error")
                
                updatedBitCoinPrice = "?? - No internet"

                completion (updatedBitCoinPrice, "Not Updated")
            }
        }
  
        
    }
    
    func updateBitCoinPrice(currencyCode : String, json : JSON)-> (String){
        
        
        
        var bitCoinCurrencyValueResult = ""
        
        if let bitCoinCurrencyValue = json[currencyCode].double {
            
            
            bitCoinCurrencyValueResult = "\(bitCoinCurrencyValue)"
            
            
        }
        else {
            
            
            bitCoinCurrencyValueResult = "No data"
            
        }
        
        return bitCoinCurrencyValueResult
    }
    
    
    func updateBitCoinTime() -> (String){

            let now = Date()
        
            let formatter = DateFormatter()
        
            formatter.timeZone = TimeZone.current
        
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
            let dateString = formatter.string(from: now)
        
            let timeChange = dateString.dateChange()
        
            return timeChange
        
    }
    
}
