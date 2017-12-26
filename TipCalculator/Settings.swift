//
//  Settings.swift
//  TipCalculator
//
//  Created by Benjamin Weis on 12/26/17.
//  Copyright © 2017 Benjamin Weis. All rights reserved.
//

import Foundation

// MARK: - Singleton

final class Settings {
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    static let shared = Settings()
    
    static let DEFAULT_OK_PERCENTAGE = 15
    static let DEFAULT_GOOD_PERCENTAGE = 18
    static let DEFAULT_GREAT_PERCENTAGE = 20
    
    var okPercentage = DEFAULT_OK_PERCENTAGE
    var goodPercentage = DEFAULT_GOOD_PERCENTAGE
    var greatPercentage = DEFAULT_GREAT_PERCENTAGE
    
    func changeDefaultPercentage(of quality: Quality, amount: Int) {
        switch (quality) {
        case .Ok:
            okPercentage += amount
            break
        case .Good:
            goodPercentage += amount
            break
        case .Great:
            greatPercentage += amount
            break
        }
    }
    
    func resetDefaults() {
        okPercentage = Settings.DEFAULT_OK_PERCENTAGE
        goodPercentage = Settings.DEFAULT_GOOD_PERCENTAGE
        greatPercentage = Settings.DEFAULT_GREAT_PERCENTAGE
    }
}

enum Quality {
    case Ok
    case Good
    case Great
}
