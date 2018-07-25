//
//  ViewController.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 23/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var allCurrency = CurrencyModel() //creating a constant referring to the CurrencyModel
    
    var currencyModelPicker: CurrencyPicker! // a var of type CurrencyPicker class
    
    var currencyPickerRow : Int = 0 // default selected row
    
    var baseBitCoinDataUrl  = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    var finalBitCoinDataUrl = ""
    
    
    
    //MARK:- Storyboard Connections
    @IBOutlet weak var bitCoinImage: UIImageView! //To change teh bitcoin image
    
    @IBOutlet weak var currencyPicker: UIPickerView! //To set up the pickerview
    
    @IBOutlet weak var bitCoinPriceLabel: UILabel!  //To change the price of the bitcoin according to the currency
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: Notification.Name.pickerHasChanged, object: nil)
        
        currencyModelPicker = CurrencyPicker() // an instance of the CurrencyPicker
        
       
        currencyPicker.delegate = currencyModelPicker
        currencyPicker.dataSource = currencyModelPicker  //assign delegate/datasource
        
        
    }
    
  
    
    

    
    @objc func onDidReceiveData(_ notification:Notification) {
        
        if let pickerRow = notification.userInfo?["rowSelected"] {
        
            currencyPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
            
        }
        print(currencyPickerRow)
        
        bitCoinPriceLabel.text = allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode
        
        finalBitCoinDataUrl = baseBitCoinDataUrl + allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode
        print(finalBitCoinDataUrl)
        
        getBitCoinData(url: finalBitCoinDataUrl)
    }
    
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

