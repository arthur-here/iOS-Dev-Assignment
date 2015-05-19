//
//  Basket.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import Foundation

class Basket {
    var purchases = [Purchase]()
    var currentCurrency: Currency
    
    init(currency: Currency) {
        self.currentCurrency = currency
    }
    
    var totalPrice: Double {
        var total = 0.0
        for purchase in purchases {
            total += Double(purchase.amount) * purchase.good.priceInGBP * currentCurrency.factorToGBP
        }
        return total
    }
}