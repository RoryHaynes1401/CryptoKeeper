//
//  CurrencyPicker.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 24/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

class CurrencyPicker: UIPickerView {
    
    
    var currencyModelData = CurrencyModel() //holds data from the CurrencyModel
    
    var cryptoCode = "BTC"
    
    let cryptoCodeModel = CryptoModel() //to access crytocode for font colour change
    
}


extension CurrencyPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyModelData.listOfCurrencyInformation.count
    }
    
    
}

extension CurrencyPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { //define height of each component
        return 100
    }
    
        
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveCryptoData(_:)), name: Notification.Name.cryptoPickerHasChanged, object: nil)
        
        
        
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) //the frame for the pickerview view
        
        let toplabel = UILabel(frame: CGRect(x: 0, y: 5, width: 100, height: 40)) // for the currency code
       
        let bottomImage = UIImageView(frame: CGRect(x: 0, y: 50, width: 100, height: 50)) // for the image
       
        //set up formatting of the text:
        let currencyCode = currencyModelData.listOfCurrencyInformation[row].currencyCode
        
        print("font size\(toplabel.font.pointSize)")
        toplabel.text = currencyCode
        
        
        
        
        toplabel.textAlignment = .center
        //toplabel.font = UIFont(name: "Times New Roman Bold", size: 20)
        toplabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        
        toplabel.makeOutLine()
        
         //refers to extension that converts hex color to UIColor
//        if let backgroundFontColour = dictCryptoColours[cryptoCode] {
//            let fontColour = backgroundFontColour[1]
//
//            print("inside currency picker font code: \(fontColour)")
//
//            toplabel.textColor = hexStringToUIColor(hex: fontColour)
//
//        }
        
        bottomImage.image = currencyModelData.listOfCurrencyInformation[row].currencyFlag
      
        
        //add the subviews to the main view, and return the UIView required by the function
        
        view.addSubview(bottomImage)
        view.addSubview(toplabel)
        return view
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let currencyRowSelected: [String: Int] = ["currencyRowSelected": row]
        
        NotificationCenter.default.post(name: Notification.Name.currencyPickerHasChanged, object: nil, userInfo: currencyRowSelected)//send info to ViewController
        
    }
    
    @objc func onDidReceiveCryptoData(_ notification:Notification) { //to get the current cryptoCode
        
        if let pickerRow = notification.userInfo?["cryptoRowSelected"] {
            
            let cryptoPickerRow = pickerRow as! Int //takes the userInfo data from the Notification centre, and assigns the selected row to the variable currencyPickerRow
            
            cryptoCode = cryptoCodeModel.listOfCryptoCurrency[cryptoPickerRow].cryptoCode
            
        }
        
        
        
        
        
    }
    
}
