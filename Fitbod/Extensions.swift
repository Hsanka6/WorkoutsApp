//
//  Extensions.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/26/24.
//

import Foundation

extension Double {
    func calculateOneRepMax(weight: Double, reps: Int) -> Double {
        guard reps > 0 else {
            return 0
        }
        var oneRM = weight / (1.0278 - 0.0278 * Double(reps))
        oneRM.round()
        return oneRM
    }
}

extension DateFormatter {
    func convertDateStringToDate(date: String) -> Date? {
        self.dateFormat = Constants.dateFormat
        return self.date(from: date)
    }
}

