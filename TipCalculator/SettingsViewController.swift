//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Benjamin Weis on 12/24/17.
//  Copyright © 2017 Benjamin Weis. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var okPercentage: UILabel!
    @IBOutlet weak var goodPercentage: UILabel!
    @IBOutlet weak var greatPercentage: UILabel!
    
    @IBOutlet weak var okDecrement: UIButton!
    @IBOutlet weak var goodDecrement: UIButton!
    @IBOutlet weak var greatDecrement: UIButton!
    
    @IBOutlet weak var okIncrement: UIButton!
    @IBOutlet weak var goodIncrement: UIButton!
    @IBOutlet weak var greatIncrement: UIButton!
    
    @IBOutlet weak var resetDefaults: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func incrementDefaultOkTipPercentage(_ sender: Any) {

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
