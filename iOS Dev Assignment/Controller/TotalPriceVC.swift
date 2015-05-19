//
//  TotalPriceVC.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 20.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class TotalPriceVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var basket: Basket!
    var currencies = [Currency]()
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPriceLabel.text = "\(basket.totalPrice) \(basket.currentCurrency.name)"
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        JSONRatesAPI.requestAllRates("GBP") { (currenciesDictionary) -> () in
            for curr in currenciesDictionary {
                self.currencies.append(Currency(name: curr.0, factorToGBP: curr.1))
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.currencyPicker.reloadAllComponents()
            }
        }
    }

    // MARK: - UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let curr = currencies[row]
        return curr.name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        basket.currentCurrency = currencies[row]
        totalPriceLabel.text = "\(basket.totalPrice) \(basket.currentCurrency.name)"
    }
}
