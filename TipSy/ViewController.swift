//
//  ViewController.swift
//  TipSy
//
//  Created by Arjit Jaiswal on 12/14/15.
//  Copyright © 2015 Arjit Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var navBar: UINavigationBar!
    
    var tipPercentages = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Change Navbar Height
        
        navBar.frame=CGRectMake(0, 0, 320, 60)
        navBar.backgroundColor=(UIColor .blackColor())
        self.view .addSubview(navBar)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_percentage")
        
        let a = defaults.doubleForKey("bill_amount")
        
        if a != 0.0 {
            billField.text = String(format: "$%.2f", a)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEdit(sender: AnyObject) {
        let tipPercentages = [0.12, 0.15, 0.18, 0.22, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "bill_amount")
        defaults.synchronize()
    }

    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

