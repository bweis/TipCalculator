//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Benjamin Weis on 12/26/17.
//  Copyright © 2017 Benjamin Weis. All rights reserved.
//

import Foundation

class TipCalculator {
    var bill: Double
    var quality: Quality
    var tipPercentage: Int
    
    var tip: Double {
        tipPercentage = Settings.shared.getPercentage(quality: quality)
        return Double(tipPercentage) / 100 * bill
    }
    var total: Double {
        return tip + bill
    }
    
    init() {
        self.bill = 0.0
        quality = .good
        tipPercentage = Settings.shared.getDefaultGoodPercentage()
        setBillAmountFromLastSave()
    }
    
    private func setBillAmountFromLastSave() {
        guard let savedDate = Settings.shared.getLastBillDate() else {
            print("No Previous Save")
            return
        }
        let timeSinceLastTerminate = abs(savedDate.timeIntervalSinceNow)
        if (timeSinceLastTerminate) <= 600 {
            print("Time since last exit: \(timeSinceLastTerminate)")
            self.bill = Settings.shared.getLastBill()
        }
    }

}
