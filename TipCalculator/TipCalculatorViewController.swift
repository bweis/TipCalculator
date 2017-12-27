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
    
    var tipCalculator = TipCalculator()
    
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
    
    @IBAction func updateBill(_ sender: Any) {
        tipCalculator.bill = Double(billField.text!) ?? 0
        updateLabels()
    }
    
    @IBAction func updateQuality(_ sender: Any) {
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipCalculator.quality = .Ok
            break
        case 1:
            tipCalculator.quality = .Good
            break
        case 2:
            tipCalculator.quality = .Great
            break
        default: break
        }
        updateLabels()
    }
    
    func updateLabels() {
        tipLabel.text = String(format: "$%.2f", tipCalculator.tip)
        totalLabel.text = String(format: "$%.2f", tipCalculator.total)
        print("Labels Updated")
    }
    

}

