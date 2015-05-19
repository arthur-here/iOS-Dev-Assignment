//
//  JSONRatesAPI.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import Foundation

class JSONRatesAPI {
    static let key = "jr-e25c758cf97ba7416718de6906b9ccff"
    static let url = "http://jsonrates.com/get/?"
    
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
                    if let price = rate.1.double {
                        ratesDictionary.updateValue(price, forKey: rate.0)
                    }
                }
                completionHander(ratesDictionary)
            } else {
                println("Error in parsing JSON: " + json.description)
            }
        }
    }
}