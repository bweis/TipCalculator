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
    
    @IBOutlet weak var okDec: UIButton!
    @IBOutlet weak var goodDec: UIButton!
    @IBOutlet weak var greatDec: UIButton!
    
    @IBOutlet weak var okInc: UIButton!
    @IBOutlet weak var goodInc: UIButton!
    @IBOutlet weak var greatInc: UIButton!
    
    let settings = Settings.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefaultPercentage(_ sender: UIButton) {
        switch sender {
        case okDec:
            settings.changeDefaultPercentage(of: .Ok, amount: -1)
            break
        case goodDec:
            settings.changeDefaultPercentage(of: .Good, amount: -1)
            break
        case greatDec:
            settings.changeDefaultPercentage(of: .Great, amount: -1)
            break
        case okInc:
            settings.changeDefaultPercentage(of: .Ok, amount: 1)
            break
        case goodInc:
            settings.changeDefaultPercentage(of: .Good, amount: 1)
            break
        case greatInc:
            settings.changeDefaultPercentage(of: .Great, amount: 1)
            break
        default: break
        }

        updateLabels()
    }
    
    @IBAction func resetDefaults(_ sender: Any) {
        settings.resetDefaults()
        updateLabels()
    }
    private func updateLabels() {
        okPercentage.text = "\(settings.okPercentage)%"
        goodPercentage.text = "\(settings.goodPercentage)%"
        greatPercentage.text = "\(settings.greatPercentage)%"
    }

}
