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
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    var tipPercentages = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoPersonLabel.text = "$0.00"
        threePersonLabel.text = "$0.00"
        fourPersonLabel.text = "$0.00"
        
        // Change Navbar Height
        
        navBar.frame=CGRectMake(0, 0, 320, 60)
        navBar.backgroundColor=(UIColor .blackColor())
        self.view .addSubview(navBar)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_percentage")
        
        let a = defaults.doubleForKey("bill_amount")
        
        if a != 0.0 {
            billField.text = String(format: "%.2f", a)
        }
        
        billField.becomeFirstResponder()
        
        onBillEdit(billField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBillEdit(sender: AnyObject) {
        // Array of tips
        let tipPercentages = [0.12, 0.15, 0.18, 0.22, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // Tip And Total Calculation
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        // Put calc values in labels
        totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        
        // Bill amount retention
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "bill_amount")
        defaults.synchronize()
        
        // Split bill calculations
        let twoPerson = total/2
        let threePerson = total/3
        let fourPerson = total/4
        
        twoPersonLabel.text = String(format: "$%.2f", twoPerson)
        threePersonLabel.text = String(format: "$%.2f", threePerson)
        fourPersonLabel.text = String(format: "$%.2f", fourPerson)
    }

    @IBAction func onScreenTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

