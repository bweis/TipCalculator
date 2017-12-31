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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }
    
    @IBAction func changeDefaultPercentage(_ sender: UIButton) {
        switch sender {
        case okDec:
            settings.changeDefaultPercentage(of: .ok, amount: -1)
            break
        case goodDec:
            settings.changeDefaultPercentage(of: .good, amount: -1)
            break
        case greatDec:
            settings.changeDefaultPercentage(of: .great, amount: -1)
            break
        case okInc:
            settings.changeDefaultPercentage(of: .ok, amount: 1)
            break
        case goodInc:
            settings.changeDefaultPercentage(of: .good, amount: 1)
            break
        case greatInc:
            settings.changeDefaultPercentage(of: .great, amount: 1)
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
        okPercentage.text = "\(settings.getDefaultOkPercentage())%"
        goodPercentage.text = "\(settings.getDefaultGoodPercentage())%"
        greatPercentage.text = "\(settings.getDefaultGreatPercentage())%"
    }

}
