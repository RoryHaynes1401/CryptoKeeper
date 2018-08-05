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
    
    var previousCryptoRow : Int = 0 //to track if the change is up or down
    
    var cryptoPickerRow : Int = 3 // default selected Currency row (BTC)
    
    let jSONData = JSONData() //to get data from JSONData class
    
    var backgroundPicture : String = "" //default bitcoin colours
    
    var fontColour : String = ""   //default bitcoin colours
    
    
    
    //MARK:- Storyboard Connections
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet var mainView: UIView! //to change background colour
    
    @IBOutlet weak var cryptoPicker: UIPickerView!
    
    @IBOutlet weak var priceProvidedBy: UILabel!
    
    @IBOutlet weak var timeUpdateLabel: UILabel!
    
    @IBOutlet weak var bitCoinImage: UIImageView! //To change teh bitcoin image
    
    @IBOutlet weak var currencyPicker: UIPickerView! //To set up the pickerview
    
    @IBOutlet weak var bitCoinPriceLabel: UILabel!  //To change the price of the bitcoin according to the currency
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeUpdateLabel.makeOutLine()
        
        priceProvidedBy.makeOutLine()
        
        bitCoinPriceLabel.makeOutLine()
        
        
        changeBackgroundColour() // call background function
        
       
        
        
        
        
        //currencyPicker.selectRow(5, inComponent: 0, animated: true)
       
        //CurrencyPicker(self.currencyPicker, didSelectRow: 0, inComponent: 0)
        // currencyModelPicker.pickerView(currencyPicker, didSelectRow: 5, inComponent: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveCurrencyData(_:)), name: Notification.Name.currencyPickerHasChanged, object: nil) //get notifications from currency picker
        
         NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveCryptoData(_:)), name: Notification.Name.cryptoPickerHasChanged, object: nil) //get notifications from crypto picker
        
        currencyModelPicker = CurrencyPicker() // an instance of the CurrencyPicker
        currencyPicker.delegate = currencyModelPicker
        currencyPicker.dataSource = currencyModelPicker //assign CurrencyPicker delegate/datasource
        
        
        cryptoModelPicker = CryptoPicker() // an instance of the CryptoPicker
        cryptoPicker.delegate = cryptoModelPicker
        cryptoPicker.dataSource = cryptoModelPicker  //assign CryptoPicker delegate/datasource
        
        
        startAnimation()
        
        
          //automatically move to a row
        
    }
    
    @objc func onDidReceiveCurrencyData(_ notification:Notification) {
        
        if let pickerRow = notification.userInfo?["currencyRowSelected"] {
        
            currencyPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
        }
        
        
        updateCurrencyInfo()
    
    }
    
    @objc func onDidReceiveCryptoData(_ notification:Notification) {
        
        previousCryptoRow = cryptoPickerRow
        
        
        if let pickerRow = notification.userInfo?["cryptoRowSelected"] {
            
           
            
            cryptoPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            currencyPicker.reloadAllComponents() //to update the font in the currency picker
        }
        
        changeBackgroundColour()
        updateCurrencyInfo()
        
        
    }
    
    
    func updateCurrencyInfo(){
        
        jSONData.getBitCoinData(cryptoType: allCrypto.listOfCryptoCurrency[cryptoPickerRow].cryptoCode, currencyCode: allCurrency.listOfCurrencyInformation[currencyPickerRow].currencyCode) { (result,time) in
            print("view controller result \(result)")
            self.bitCoinPriceLabel.text =  self.allCurrency.listOfCurrencyInformation[self.currencyPickerRow].currencySymbol+result //combine currency price with currency symbol
            
            //TODO:- test outline
            self.bitCoinPriceLabel.makeOutLine()
            self.timeUpdateLabel.text = time
            self.timeUpdateLabel.makeOutLine()
            
        
        }
    }
    
     //TODO:- change the backgound function
    
    func changeBackgroundColour(){
        
        let cryptoCode = allCrypto.listOfCryptoCurrency[cryptoPickerRow].cryptoCode
        print(cryptoCode)
        
        if let backgroundFontColour = dictCryptoColours[cryptoCode] {
            
           
            backgroundPicture = backgroundFontColour[0]
            
           
        
        
            
            if previousCryptoRow < cryptoPickerRow {
            
        UIView.transition(with: backgroundImage, duration: 0.5, options: .transitionFlipFromTop, animations: {
            self.backgroundImage.image = UIImage(named: self.backgroundPicture)
        })
            }else if previousCryptoRow > cryptoPickerRow{
                
                UIView.transition(with: backgroundImage, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                    self.backgroundImage.image = UIImage(named: self.backgroundPicture)
                })
                
            }
           
        }
        
    }
    
    func startAnimation(){
        
        let locale = Locale.current
        let localCurrencyCode = locale.currencyCode! //check local currency code
        
        
        if let localCurrencyCodeIndex = allCurrency.listOfCurrencyInformation.index(where: {$0.currencyCode == localCurrencyCode}) {
            currencyPicker.selectRow(currencyPickerRow, inComponent: 0, animated: true) // row for local currency
            currencyPicker.showsSelectionIndicator = true
            self.currencyPickerRow = localCurrencyCodeIndex //set current currency row to local currency row (otherwise default)
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { //scroll to end of picker
//            let lastCurrencyRow = self.allCurrency.listOfCurrencyInformation.count - 1
//
//            let lastCrytoRow = self.allCrypto.listOfCryptoCurrency.count - 1
//            self.currencyPicker.selectRow(lastCurrencyRow, inComponent: 0, animated: true) //move to last row
//            self.cryptoPicker.selectRow(lastCrytoRow, inComponent: 0, animated: true)
//
//        }
//        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: { //scroll back to local currency


            self.currencyPicker.selectRow(self.currencyPickerRow, inComponent: 0, animated: true) //move to default row / local currency row
            self.cryptoPicker.selectRow(self.cryptoPickerRow, inComponent: 0, animated: true)
            self.updateCurrencyInfo()
        }
        )
        
        
        
        
        
        
    }
    
    
    
   
}

