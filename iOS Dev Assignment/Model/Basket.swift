//
//  Basket.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import Foundation

class Basket {
    private var goods = [GoodItem]()
    var currentCurrency: Currency
    
    init(currency: Currency) {
        self.currentCurrency = currency
    }
    
    var totalPrice: Double {
        var total = 0.0
        for item in goods {
            total += item.priceInGBP * currentCurrency.factorToGBP
        }
        return total
    }
    
    func getAmountOfGoodItems(item: GoodItem) -> Int {
        var count = 0
        for i in goods {
            if i === item {
                count++
            }
        }
        return count
    }
    
    func addGoodItem(item: GoodItem) {
        goods.append(item)
    }
    
    func removeGoodItem(item: GoodItem) {
        if let index = getGoodItemIndex(item) {
            goods.removeAtIndex(index)
        }
    }
    
    private func getGoodItemIndex(item: GoodItem) -> Int? {
        for (i, g) in enumerate(goods) {
            if g === item {
                return i
            }
        }
        return nil
    }
}