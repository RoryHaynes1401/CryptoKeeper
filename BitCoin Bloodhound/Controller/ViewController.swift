//
//  ViewController.swift
//  BitCoin Bloodhound
//
//  Created by Rory Haynes on 23/07/2018.
//  Copyright © 2018 Snowy Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK:- Storyboard Connections
    
        @IBOutlet weak var currencyPicker: UIPickerView!
    
        @IBOutlet weak var bitCoinPriceLabel: UILabel!
    
    //TODO:- Move data to model folder
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"] //array of all the currency abbreviations
    
    //TODO:- Add an array of flag images?? (or add images to picker directly)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK:- pickerview delegates and functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // to display 1 row in the picker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count //the number of components should be equal to the number of elements in the array
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row] //the title for each row will be the string found at the corresponding array element
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        bitCoinPriceLabel.text = currencyArray[row]
    }
    
    //TODO:- add images to the picker (or add flags directly to the array)
    
    

    
    

    
    
   

    

    
    
}

