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
    
    // Public Accessors
    func getDefaultOkPercentage() -> Int {
        return UserDefaults.standard.object(forKey: "OK_PERCENTAGE") as? Int ?? Settings.DEFAULT_OK_PERCENTAGE
    }
    
    func getDefaultGoodPercentage() -> Int {
        return UserDefaults.standard.object(forKey: "GOOD_PERCENTAGE") as? Int ?? Settings.DEFAULT_GOOD_PERCENTAGE
    }
    
    func getDefaultGreatPercentage() -> Int {
        return UserDefaults.standard.object(forKey: "GREAT_PERCENTAGE") as? Int ?? Settings.DEFAULT_GREAT_PERCENTAGE
    }

    func getLastBill() -> Double {
        return UserDefaults.standard.object(forKey: "BILL_AMOUNT") as? Double ?? 0.0
    }
    
    func getLastBillDate() -> NSDate? {
        return UserDefaults.standard.object(forKey: "BILL_DATE") as? NSDate
    }
    
    // Public Modifier
    func changeDefaultPercentage(of quality: Quality, amount: Int) {
        switch (quality) {
        case .ok:
            if (getDefaultOkPercentage() + amount >= 0) && (getDefaultOkPercentage() + amount < getDefaultGoodPercentage()) {
                changeDefaultPercentage(quality: .ok, percentage: getDefaultOkPercentage() + amount)
            }
            break
        case .good:
            if getDefaultGoodPercentage() + amount > getDefaultOkPercentage() && getDefaultGoodPercentage() + amount < getDefaultGreatPercentage() {
                changeDefaultPercentage(quality: .good, percentage: getDefaultGoodPercentage() + amount)
            }
            break
        case .great:
            if getDefaultGreatPercentage() + amount > getDefaultGoodPercentage() && getDefaultGreatPercentage() + amount <= 100 {
                changeDefaultPercentage(quality: .great, percentage: getDefaultGreatPercentage() + amount)
            }
            break
        }
    }
    
    // Private Internal modifier
    private func changeDefaultPercentage(quality: Quality, percentage: Int) {
        let defaults = UserDefaults.standard
        switch quality {
        case .ok:
            defaults.set(percentage, forKey: "OK_PERCENTAGE")
            break
        case .good:
            defaults.set(percentage, forKey: "GOOD_PERCENTAGE")
            break
        case .great:
            defaults.set(percentage, forKey: "GREAT_PERCENTAGE")
            break
        }
        defaults.synchronize()
    }
    
    func getPercentage(quality: Quality) -> Int {
        switch (quality) {
        case .ok:
            return getDefaultOkPercentage()
        case .good:
            return getDefaultGoodPercentage()
        case .great:
            return getDefaultGreatPercentage()
        }
    }
    
    func resetDefaults() {
        changeDefaultPercentage(quality: .ok, percentage: Settings.DEFAULT_OK_PERCENTAGE)
        changeDefaultPercentage(quality: .good, percentage: Settings.DEFAULT_GOOD_PERCENTAGE)
        changeDefaultPercentage(quality: .great, percentage: Settings.DEFAULT_GREAT_PERCENTAGE)
    }

    func saveBill(_ bill: Double) {
        UserDefaults.standard.set(bill, forKey: "BILL_AMOUNT")
        UserDefaults.standard.synchronize()
    }
    
    func saveDate() {
        UserDefaults.standard.set(NSDate(), forKey: "BILL_DATE")
        UserDefaults.standard.synchronize()
    }
    
}

enum Quality {
    case ok
    case good
    case great
}
