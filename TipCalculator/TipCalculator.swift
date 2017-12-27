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
        quality = .Good
        tipPercentage = Settings.shared.goodPercentage
    }
    

}
