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
    
    func getBitCoinData(url: String) { //method requiring a url that fetches data in the form of a JSON
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess{
                
                print("bitcoincurrency data received successfully")
                
                let bitCoinCurrencyJSON : JSON = JSON(response.result.value!) //force unwrap, as this is only called if a reuslt is found
                self.updateBitCoinPrice(json: bitCoinCurrencyJSON)
                
            }
            else{
                
                print("Error: \(String(describing: response.result.error))")
            }
        }
        
        
        
        
        
        
    }
    
    func updateBitCoinPrice(json : JSON){
        
        //TODO:- Implement a menthod to parse the JSon, and update the display.
        
        if let bitCoinCurrencyValue = json["ask"].double {
            
            print(bitCoinCurrencyValue)
            
        }
        else {
            
            print("failed")
            
        }
    }
    
    
    
    
    
    
}
