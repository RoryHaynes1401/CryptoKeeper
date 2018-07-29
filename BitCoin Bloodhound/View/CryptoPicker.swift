//
//  CryptoPicker.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 27/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

class CryptoPicker: UIPickerView {
    

    
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
        return 100
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        //TODO:- change below
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) //the frame for the pickerview view
        
        let toplabel = UILabel(frame: CGRect(x: 0, y: 5, width: 100, height: 30)) // for the currency code
        
        let bottomImage = UIImageView(frame: CGRect(x: 0, y: 40, width: 100, height: 50)) // for the image
        
        toplabel.text = cryptoModelData.listOfCryptoCurrency[row].cryptoCode
        toplabel.textAlignment = .center
        toplabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        let color1 = hexStringToUIColor(hex: "#D7A554") //refers to extension that converts hex color to UIColor
        toplabel.textColor = color1
        
        bottomImage.image = cryptoModelData.listOfCryptoCurrency[row].cryptoImage
        bottomImage.contentMode = .scaleAspectFit
    
        
        
        //add the subviews to the main view, and return the UIView required by the function
        view.addSubview(toplabel)
        view.addSubview(bottomImage)
        
        return view
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let rowSelected: [String: Int] = ["rowSelected": row]
        //change below
        NotificationCenter.default.post(name: Notification.Name.cryptoPickerHasChanged, object: nil, userInfo: rowSelected)//send info to ViewController
        
    }
    
}
