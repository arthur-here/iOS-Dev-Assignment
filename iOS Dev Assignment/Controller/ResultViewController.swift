//
//  ResultViewController.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 20.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource {

    var basket: Basket!

    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPriceLabel.text = "Total price of your basket: \(basket.totalPrice) \(basket.currentCurrency.name)"
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basket.amount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoodItemInfo") as! UITableViewCell
        
        let (goodItem, amount) = Array(basket.goodsList)[indexPath.row]
        
        cell.textLabel!.text = "\(goodItem.name) x \(amount)"
        cell.detailTextLabel!.text = "\(basket.currentCurrency.factorToGBP * Double(amount) * goodItem.priceInGBP) \(basket.currentCurrency.name)"
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
