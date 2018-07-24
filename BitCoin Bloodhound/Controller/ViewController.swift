//
//  ViewController.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 23/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allCurrency = CurrencyModel() //creating a constant referring to the CurrencyModel
    
    var currencyModelPicker: CurrencyPicker! // a var of type CurrencyPicker class
    
    
    
    //MARK:- Storyboard Connections
    @IBOutlet weak var bitCoinImage: UIImageView! //To change teh bitcoin image
    
    @IBOutlet weak var currencyPicker: UIPickerView! //To set up the pickerview
    
    @IBOutlet weak var bitCoinPriceLabel: UILabel!  //To change the price of the bitcoin according to the currency
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyModelPicker = CurrencyPicker() // an instance of the CurrencyPicker
        
       
        currencyPicker.delegate = currencyModelPicker
        currencyPicker.dataSource = currencyModelPicker  //assign delegate/datasource
        
        
    }
    
    //MARK:- pickerview delegates and functions
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // to display 1 row in the picker
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return allCurrency.listOfCurrencyInformation.count //the number of components should be equal to the number of elements in the listOfCurrencyInformation array
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return allCurrency.listOfCurrencyInformation[row].currencyCode //the title for each row will be the string found at the corresponding listOfCurrencyInformation array element
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(row)
//
//        bitCoinPriceLabel.text = allCurrency.listOfCurrencyInformation[row].currencyCode
//         bitCoinImage.image = allCurrency.listOfCurrencyInformation[row].currencyFlag // the currency code found at the corresponding listOfCurrencyInformation array element's text and flag properties
//    }
//
   
    
    

    
    

    
    
   

    

    
    
}

