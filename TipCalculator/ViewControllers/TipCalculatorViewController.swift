//
//  ViewController.swift
//  TipCalculator
//
//  Created by Benjamin Weis on 12/24/17.
//  Copyright © 2017 Benjamin Weis. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    var tipCalculator = TipCalculator()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !(tipCalculator.bill > 0) {
            billField.becomeFirstResponder()
        }
        billField.text = tipCalculator.bill == 0.0 ? "" : "\(tipCalculator.bill)".currencyFormatting(number: tipCalculator.bill)
        updateLabels()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Added to fix bug in iOS 11.2 where button would stay enabled upon segue
        settingsButton.isEnabled = false
        settingsButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func updateBill(_ sender: UITextField) {
        sender.text = sender.text?.currencyInputFormatting()
        tipCalculator.bill = (sender.text ?? "").decimalValueFromCurrency()
        Settings.shared.saveBill(tipCalculator.bill)
        updateLabels()
    }
    
    @IBAction func updateQuality(_ sender: UISegmentedControl) {
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipCalculator.quality = .ok
            break
        case 1:
            tipCalculator.quality = .good
            break
        case 2:
            tipCalculator.quality = .great
            break
        default: break
        }
        updateLabels()
    }
    
    func updateLabels() {
        tipLabel.text = String(format: "$%.2f", tipCalculator.tip)
        totalLabel.text = String(format: "$%.2f", tipCalculator.total)
        tipSelector.setTitle("\(Settings.shared.getDefaultOkPercentage())%", forSegmentAt: 0)
        tipSelector.setTitle("\(Settings.shared.getDefaultGoodPercentage())%", forSegmentAt: 1)
        tipSelector.setTitle("\(Settings.shared.getDefaultGreatPercentage())%", forSegmentAt: 2)
    }
    

}

