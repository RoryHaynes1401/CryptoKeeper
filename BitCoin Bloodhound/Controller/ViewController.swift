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
    
    var allCrypto = CryptoModel()
    
    var currencyModelPicker: CurrencyPicker! // a var of type CurrencyPicker class
    
    var cryptoModelPicker: CryptoPicker! // a var of type CryptoPicker class
    
    var currencyPickerRow : Int = 5 // default selected row
    
    var baseBitCoinDataUrl  = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    var baseCryptoCurrencyDataURL = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"
    
    var finalBitCoinDataUrl = ""
    
    let jSONData = JSONData() //to get data from JSONData class
    
    
    
    
    //MARK:- Storyboard Connections
    
    @IBOutlet weak var cryptoPicker: UIPickerView!
    
    @IBOutlet weak var priceProvidedBy: UILabel!
    
    @IBOutlet weak var timeUpdateLabel: UILabel!
    
    @IBOutlet weak var bitCoinImage: UIImageView! //To change teh bitcoin image
    
    @IBOutlet weak var currencyPicker: UIPickerView! //To set up the pickerview
    
    @IBOutlet weak var bitCoinPriceLabel: UILabel!  //To change the price of the bitcoin according to the currency
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:- find correct array member / row from the local currency
        
        let locale = Locale.current
        // let localCurrencySymbol = locale.currencySymbol!
        let localCurrencyCode = locale.currencyCode!
        
        
        currencyPicker.selectRow(5, inComponent: 0, animated: false)
       
        //CurrencyPicker(self.currencyPicker, didSelectRow: 0, inComponent: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: Notification.Name.currencyPickerHasChanged, object: nil) //get notifications from currency picker
        
         NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: Notification.Name.cryptoPickerHasChanged, object: nil) //get notifications from crypto picker
        
        currencyModelPicker = CurrencyPicker() // an instance of the CurrencyPicker
        currencyPicker.delegate = currencyModelPicker
        currencyPicker.dataSource = currencyModelPicker  //assign CurrencyPicker delegate/datasource
        
        cryptoModelPicker = CryptoPicker() // an instance of the CryptoPicker
        cryptoPicker.delegate = cryptoModelPicker
        cryptoPicker.dataSource = cryptoModelPicker  //assign CryptoPicker delegate/datasource
        
        //TODO:- find array member for the local currency, and set row
        if let localCurrencyCodeIndex = allCurrency.listOfCurrencyInformation.index(where: {$0.currencyCode == localCurrencyCode}) {
                currencyPickerRow = localCurrencyCodeIndex
                currencyPicker.selectRow(currencyPickerRow, inComponent: 0, animated: false)
            
            }
        
        updateCurrencyInfo()
        // currencyModelPicker.pickerView(currencyPicker, didSelectRow: 5, inComponent: 0)  //automatically move to a row
        
    }
    
    @objc func onDidReceiveData(_ notification:Notification) {
        
        if let pickerRow = notification.userInfo?["rowSelected"] {
        
            currencyPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
        }
        
        //finalBitCoinDataUrl = allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode
        //TODO:- UPDATE CRYPTOTYPE
        updateCurrencyInfo()
    
    }
    
    
    func updateCurrencyInfo(){
        
        jSONData.getBitCoinData(cryptoType: "BTC", currencyCode: allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode) { (result,time) in
            print("view controller result \(result)")
            self.bitCoinPriceLabel.text =  self.allCurrency.listOfCurrencyInformation[self.currencyPickerRow].currencySymbol+result //combine currency price with currency symbol
            self.timeUpdateLabel.text = time
        
        }
    }
   
}

