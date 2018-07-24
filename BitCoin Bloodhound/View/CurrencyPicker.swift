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
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)) //the frame for the pickerview view
        
        let toplabel = UILabel(frame: CGRect(x: 0, y: 5, width: 100, height: 30)) // for the currency code
        
        let bottomImage = UIImageView(frame: CGRect(x: 0, y: 40, width: 100, height: 50)) // for the image
        
        //set up formatting of the text:
        toplabel.text = currencyModelData.listOfCurrencyInformation[row].currencyCode
        toplabel.textAlignment = .center
        toplabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        
        bottomImage.image = currencyModelData.listOfCurrencyInformation[row].currencyFlag
        
        //add the subviews to the main view, and return the UIView required by the function
        view.addSubview(toplabel)
        view.addSubview(bottomImage)
        
        return view
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        NotificationCenter.default.post(name: Notification.Name.pickerHasChanged, object: self) //send info to ViewController
        
    }
    
}
