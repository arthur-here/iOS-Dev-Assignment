//
//  GoodCardView.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 20.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class GoodCardView: UICollectionViewCell {

    @IBOutlet weak var goodNameLabel: UILabel!
    @IBOutlet weak var goodPriceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var goodImageView: UIView!
    var image: UIImage? {
        didSet {
            let imageView = PrettyImageView(image: image, frame: goodImageView.bounds)
            goodImageView.subviews.first?.removeFromSuperview()
            goodImageView.addSubview(imageView)
            imageView.animate()
        }
    }
    
    @IBAction func minusButtonTouch() {
    }
    
    @IBAction func plusButtonTouch() {
    }

}
