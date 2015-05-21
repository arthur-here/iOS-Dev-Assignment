//
//  JSONRatesAPI.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import Foundation

class JSONRatesAPI {
    private static let key = "jr-e25c758cf97ba7416718de6906b9ccff"
    private static let url = "http://jsonrates.com/get/?"
    
    class func convert(fromCurrency: String, toCurrency: String, completionHandler: (Double) -> ()) {
        let requestURL = NSURL(string: url + "from=" + fromCurrency + "&to=" + toCurrency + "&apiKey=" + key)
        let request = NSURLRequest(URL: requestURL!)
        
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
            if (error != nil) {
                println(error)
                return
            }
            let json = JSON(data: data)
            if let rate = json["rate"].double {
                completionHandler(rate)
            } else {
                println("Error in parsing JSON: " + json.description)
            }
        }
    }
    
    class func requestAllRates(base: String, completionHander: ([String: Double]) -> ()) {
        let requestURL = NSURL(string: url + "base=" + base + "&apiKey=" + key)
        let request = NSURLRequest(URL: requestURL!)
        
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
            if (error != nil) {
                println(error)
                return
            }
            let json = JSON(data: data)
            if let rates = json["rates"].dictionary {
                var ratesDictionary = [String: Double]()
                for rate in rates {
                    if let priceString = rate.1.string {
                        ratesDictionary.updateValue((priceString as NSString).doubleValue, forKey: rate.0)
                    }
                }
                completionHander(ratesDictionary)
            } else {
                println("Error in parsing JSON: " + json.description)
            }
        }
    }
    
    class func requestCurrenciesList(completionHandler: ([String: String]) -> ()) {
        let requestURL = NSURL(string: "http://jsonrates.com/currencies.json")
        let request = NSURLRequest(URL: requestURL!)
        
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
            if (error != nil) {
                println(error)
                return
            }
            let json = JSON(data: data)
            if let currList = json.dictionary {
                var currDictionary = [String: String]()
                for curr in currList {
                    if let currName = curr.1.string {
                        currDictionary.updateValue(currName, forKey: curr.0)
                    }
                }
                completionHandler(currDictionary)
            } else {
                println("Error in parsing JSON: " + json.description)
            }
        }
    }
    
    
}








