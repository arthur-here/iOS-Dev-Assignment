//
//  Good.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class GoodItem {
    let name: String
    let priceInGBP: Double
    let image: UIImage?
    
    init(name: String, priceInGBP: Double, image: UIImage?) {
        self.name = name
        self.priceInGBP = priceInGBP
        self.image = image
    }
    
    convenience init(name: String, priceInGBP: Double) {
        self.init(name: name, priceInGBP: priceInGBP, image: nil)
    }
    
}