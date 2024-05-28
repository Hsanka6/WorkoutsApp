//
//  ExerciseDetailViewModel.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/26/24.
//

import Foundation

class ExerciseDetailViewModel {
    var exercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    func setOneRepMaxGraphViewModel() -> OneRepMaxViewModel {
        return OneRepMaxViewModel(exerciseName: exercise.name, detailLabel: Constants.oneRepMaxLabelText, weight: String(exercise.personalRecord))
    }
    
    // Group data by date and get the maximum one-rep max per day
    func getOneRepMaxPerDay() -> [OneRepMax] {
        var dateToMaxOneRepMax = [Date: OneRepMax]()
        for entry in exercise.oneRepMaxes {
            let date = Calendar.current.startOfDay(for: entry.date)
            if let existingMax = dateToMaxOneRepMax[date] {
                if entry.weight > existingMax.weight {
                    dateToMaxOneRepMax[date] = entry
                }
            } else {
                dateToMaxOneRepMax[date] = entry
            }
        }
        return dateToMaxOneRepMax.values.sorted { $0.date > $1.date }
    }
    
    func getMinValueForGraph(oneRepMaxes: [OneRepMax]) -> Int {
        let minWeight = oneRepMaxes.min { $0.weight < $1.weight }?.weight ?? 0
        if minWeight == 0 { return 0 }
        return Int(minWeight) - 10 // added extra spacing so values don't get too close to x axis values
    }
    
    func getMaxValueForGraph(oneRepMaxes: [OneRepMax]) -> Int {
        let maxWeight = oneRepMaxes.max { $0.weight < $1.weight }?.weight ?? 400 // made an educated guess for default value
        return Int(maxWeight)
    }
    
}
