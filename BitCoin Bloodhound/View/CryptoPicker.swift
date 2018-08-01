//
//  CryptoPicker.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 27/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

class CryptoPicker: UIPickerView {
    
    let coinSize : Int = 100
    

    
    var cryptoModelData = CryptoModel() // initialise an instance of the data model
}

extension CryptoPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cryptoModelData.listOfCryptoCurrency.count
    }
    
    
}

extension CryptoPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { //define height of each component
        return CGFloat(coinSize)
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: coinSize, height: coinSize)) //the frame for the pickerview view
        
        let mainView = UIImageView(frame: CGRect(x: 0, y: 0, width: coinSize, height: coinSize)) // for the currency code
        
        
        mainView.image = cryptoModelData.listOfCryptoCurrency[row].cryptoImage
        mainView.contentMode = .scaleToFill
    
        
        
        //add the subviews to the main view, and return the UIView required by the function
        view.addSubview(mainView)
        
        
        return view
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let rowSelected: [String: Int] = ["cryptoRowSelected": row]
        //change below
        NotificationCenter.default.post(name: Notification.Name.cryptoPickerHasChanged, object: nil, userInfo: rowSelected)//send info to ViewController
        
    }
    
}
