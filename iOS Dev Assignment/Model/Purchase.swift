//
//  Purchase.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import Foundation

class Purchase {
    let good: Good
    var amount: Int
    
    init(good: Good, amount: Int) {
        self.good = good
        self.amount = amount
    }
    
    convenience init(good: Good) {
        self.init(good: good, amount: 1)
    }
}