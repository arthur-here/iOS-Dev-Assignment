//
//  GoodCardView.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 20.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class GoodCardCell: UICollectionViewCell {

    @IBOutlet weak var goodNameLabel: UILabel!
    @IBOutlet weak var goodPriceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var goodImageView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var image: UIImage? {
        didSet {
            let imageView = PrettyImageView(image: image, frame: goodImageView.bounds)
            imageView.animationDuration = 1.0
            goodImageView.subviews.first?.removeFromSuperview()
            goodImageView.addSubview(imageView)
            imageView.animate()
        }
    }
    
    override func didMoveToSuperview() {
        layer.cornerRadius = 3
        layer.masksToBounds = true
    }
}
