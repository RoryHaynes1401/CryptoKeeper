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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyModelData.listOfCurrencyInformation[row].currencyCode //the title for each row will be the string found at the corresponding listOfCurrencyInformation array element
    }
    
}
