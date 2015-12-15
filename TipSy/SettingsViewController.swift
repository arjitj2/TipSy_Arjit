//
//  SettingsViewController.swift
//  TipSy
//
//  Created by Arjit Jaiswal on 12/14/15.
//  Copyright © 2015 Arjit Jaiswal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsBar: UINavigationBar!
    @IBOutlet weak var defaultSettings: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        settingsBar.frame=CGRectMake(0, 0, 320, 60)
        settingsBar.backgroundColor=(UIColor .blackColor())
        self.view .addSubview(settingsBar)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaultSettings.selectedSegmentIndex = defaults.integerForKey("default_percentage")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultSettings.selectedSegmentIndex, forKey: "default_percentage")
        defaults.synchronize()
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
