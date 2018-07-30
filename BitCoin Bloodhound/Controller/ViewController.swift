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
    
    var currencyPickerRow : Int = 0 // default selected Currency row
    
    var cryptoPickerRow : Int = 0 // default selected Currency row
    
    let jSONData = JSONData() //to get data from JSONData class
    
    var backgroundColour : String = "" //default bitcoin colours
    
    var fontColour : String = ""   //default bitcoin colours
    
    
    
    //MARK:- Storyboard Connections
    
    
    @IBOutlet var mainView: UIView! //to change background colour
    
    @IBOutlet weak var cryptoPicker: UIPickerView!
    
    @IBOutlet weak var priceProvidedBy: UILabel!
    
    @IBOutlet weak var timeUpdateLabel: UILabel!
    
    @IBOutlet weak var bitCoinImage: UIImageView! //To change teh bitcoin image
    
    @IBOutlet weak var currencyPicker: UIPickerView! //To set up the pickerview
    
    @IBOutlet weak var bitCoinPriceLabel: UILabel!  //To change the price of the bitcoin according to the currency
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:- update the background function
        changeBackgroundColour() // call background function
        
        //TODO:- find correct array member / row from the local currency
        
        let locale = Locale.current
        // let localCurrencySymbol = locale.currencySymbol!
        let localCurrencyCode = locale.currencyCode!
        
        
        currencyPicker.selectRow(5, inComponent: 0, animated: false)
       
        //CurrencyPicker(self.currencyPicker, didSelectRow: 0, inComponent: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveCurrencyData(_:)), name: Notification.Name.currencyPickerHasChanged, object: nil) //get notifications from currency picker
        
         NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveCryptoData(_:)), name: Notification.Name.cryptoPickerHasChanged, object: nil) //get notifications from crypto picker
        
        currencyModelPicker = CurrencyPicker() // an instance of the CurrencyPicker
        currencyPicker.delegate = currencyModelPicker
        currencyPicker.dataSource = currencyModelPicker //assign CurrencyPicker delegate/datasource
        
        
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
    
    @objc func onDidReceiveCurrencyData(_ notification:Notification) {
        
        if let pickerRow = notification.userInfo?["currencyRowSelected"] {
        
            currencyPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
        }
        
        
        updateCurrencyInfo()
    
    }
    
    @objc func onDidReceiveCryptoData(_ notification:Notification) {
        
        if let pickerRow = notification.userInfo?["cryptoRowSelected"] {
            
            cryptoPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
        }
        
        
        updateCurrencyInfo()
        
        
    }
    
    
    func updateCurrencyInfo(){
        
        jSONData.getBitCoinData(cryptoType: allCrypto.listOfCryptoCurrency[cryptoPickerRow].cryptoCode, currencyCode: allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode) { (result,time) in
            print("view controller result \(result)")
            self.bitCoinPriceLabel.text =  self.allCurrency.listOfCurrencyInformation[self.currencyPickerRow].currencySymbol+result //combine currency price with currency symbol
            self.timeUpdateLabel.text = time
            self.changeBackgroundColour()
        
        }
    }
    
     //TODO:- update the background function
    
    func changeBackgroundColour(){
        
        let cryptoCode = allCrypto.listOfCryptoCurrency[cryptoPickerRow].cryptoCode
        print(cryptoCode)
        
        if let backgroundFontColour = dictCryptoColours[cryptoCode] {
        backgroundColour = backgroundFontColour[0]
        fontColour = backgroundFontColour[1]
            
        print("background\(backgroundColour)")
        print("font\(fontColour)")
        
        mainView.backgroundColor = hexStringToUIColor(hex: backgroundColour)
            
        priceProvidedBy.textColor = hexStringToUIColor(hex: fontColour)
        bitCoinPriceLabel.textColor = hexStringToUIColor(hex: fontColour)
        timeUpdateLabel.textColor = hexStringToUIColor(hex: fontColour)
        
        
        }
        
    }
   
}

