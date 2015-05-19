//
//  SelectGoodVC.swift
//  iOS Dev Assignment
//
//  Created by Arthur Myronenko on 20.05.15.
//  Copyright (c) 2015 Arthur Myronenko. All rights reserved.
//

import UIKit

class SelectGoodVC: UITableViewController {

    @IBOutlet weak var goodName: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var purchase: Purchase!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goodName.text = purchase.good.name
        amountLabel.text = "1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        purchase.amount = Int(sender.value)
        amountLabel.text = "\(purchase.amount)"
    }

    @IBAction func doneButtonTouch(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
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
