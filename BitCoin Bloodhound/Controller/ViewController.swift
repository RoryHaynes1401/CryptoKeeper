//
//  ViewController.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 23/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

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
    }
   

    

    
    
}

