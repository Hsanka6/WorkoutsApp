//
//  OneRepMaxViewModel.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/27/24.
//

import Foundation

struct OneRepMaxViewModel {
    var exerciseName: String
    var detailLabel: String
    var weight: String
    
    init(exerciseName: String, detailLabel: String, weight: String) {
        self.exerciseName = exerciseName
        self.detailLabel = detailLabel
        self.weight = weight
    }
}
