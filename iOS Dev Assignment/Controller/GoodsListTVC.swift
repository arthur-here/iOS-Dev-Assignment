//
//  GoodsListTVC.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 19.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class GoodsListTVC: UITableViewController {

    var basket: Basket?
    var goods = [Good]()
    var purchase: Purchase?
    var selectedPurchases = [Purchase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let milk = Good(name: "Milk", priceInGBP: 0.95)
        let cola = Good(name: "Cola", priceInGBP: 0.50)
        let beer = Good(name: "Beer", priceInGBP: 4.99)
        let wine = Good(name: "Wine", priceInGBP: 10.90)
        goods += [milk, cola, beer, wine]
    }
    
    @IBAction func saveButtonTouch(sender: AnyObject) {
        basket?.purchases += selectedPurchases
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GoodCell", forIndexPath: indexPath) as! UITableViewCell

        let good = goods[indexPath.row]
        cell.textLabel?.text = good.name
        cell.detailTextLabel?.text = "\(good.priceInGBP)"

        return cell
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
        purchase = Purchase(good: goods[indexPath.row])
        selectedPurchases.append(purchase!)
        println(selectedPurchases)
        if shouldPerformSegueWithIdentifier("toAmountSelect", sender: nil) {
            performSegueWithIdentifier("toAmountSelect", sender: self)
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let good = goods[indexPath.row]
        removeGoodFromList(good)
        println(selectedPurchases)
    }

    private func removeGoodFromList(good: Good) {
        var newPurchases = [Purchase]()
        for p in selectedPurchases {
            if p.good !== good {
                newPurchases.append(p)
            }
        }
        selectedPurchases = newPurchases
    }
    
    // MARK: - Navigation

    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "toAmountSelect" {
            if (purchase == nil) {
                return false
            }
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAmountSelect" {
            let dvc = segue.destinationViewController as! SelectGoodVC
            dvc.purchase = purchase
        }
    }
    

}
