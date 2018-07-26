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
    
    
    
    func getBitCoinData(url: String, completion:@escaping (String) -> Void ) { //method requiring a url that fetches data in the form of a JSON
        print("alamofire called")
        var updatedBitCoinPrice : String = ""
        
        Alamofire.request(url, method: .get).validate().responseJSON { (response) in
            if response.result.isSuccess{
                
                print("bitcoincurrency data received successfully")
                
                let bitCoinCurrencyJSON : JSON = JSON(response.result.value!) //force unwrap, as this is only called if a reuslt is found
                updatedBitCoinPrice = self.updateBitCoinPrice(json: bitCoinCurrencyJSON)
                print("from alamo \(updatedBitCoinPrice)")
                completion (updatedBitCoinPrice)
                
            }
            else if response.result.isFailure {
                
                print("Error")
                
                updatedBitCoinPrice = "?? - No internet"

                completion (updatedBitCoinPrice)
            }
        }
  
        
    }
    
    func updateBitCoinPrice(json : JSON)-> (String){
        
        //TODO:- Implement a menthod to parse the JSon, and update the display.
        
        var bitCoinCurrencyValueResult = ""
        
        if let bitCoinCurrencyValue = json["ask"].double {
            
            
            bitCoinCurrencyValueResult = "\(bitCoinCurrencyValue)"
            
            
        }
        else {
            
            
            //TODO:- print to screen that connection failed
            print("failed")
            bitCoinCurrencyValueResult = "Failed to find updated price"
            
        }
        
        return bitCoinCurrencyValueResult
    }
    
    
    func updateBitCoinTime(json : JSON) -> (String){
        
        if let updateTime = json["display_timestamp"].string {
            
            //format time
            print("time: \(updateTime)")
        
            let formatDate = updateTime.dateChange()
            
            print("formatdate:\(formatDate)")
            
            
            timeStamp = "Updated: " + formatDate + " UTC"
        }
            
        else{
            
            
            timeStamp = "Not updated"
            
        }
        
        
        return timeStamp
        
    }
    
}
