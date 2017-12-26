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
}
