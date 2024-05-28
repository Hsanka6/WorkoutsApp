//
//  Models.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/21/24.
//

import Foundation

struct Workout: Equatable {
    let date: String
    let exercise: String
    let reps: Int
    let weight: Int
    let oneRepMaxWeight: Double
}

struct Exercise {
    let name: String
    let personalRecord: Int
    var oneRepMaxes: [OneRepMax]
}

struct OneRepMax: Identifiable {
    var id: String
    var weight: Double
    var date: Date
}
