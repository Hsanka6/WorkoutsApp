//
//  WorkoutViewModel.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/17/24.
//

import Foundation
class ExercisesTableViewModel {
    
    var dataManager: DataService
    var exercises: [Exercise] = [] {
        didSet {
            dataDidChange?()
        }
    }
    
    var dataDidChange: (() -> Void)?

    
    init(dataManager: DataService) {
        self.dataManager = dataManager
    }
    
    var numberOfRows: Int {
        return exercises.count
    }
    
    func populateExercises(fileName: String) {
        getWorkoutsAndConvertToExercises(fileName: fileName){ [weak self] exercises in
            guard let self = self else { return }
            self.exercises = exercises
        }
    }
    
    func getWorkoutsAndConvertToExercises(fileName: String, completion: @escaping ([Exercise]) -> Void) {
        guard let workouts = dataManager.loadWorkoutsFromCSV(fileName: fileName) else {
            return
        }
        
        var exerciseToOneRepMaxes = [String:[OneRepMax]]() // exercise name -> array of one rep max 
        
        for workout in workouts {
            let date = DateFormatter().convertDateStringToDate(date: workout.date) ?? Date()
            let oneRepMax = OneRepMax(id: UUID().uuidString, weight: workout.oneRepMaxWeight, date: date)
            exerciseToOneRepMaxes[workout.exercise, default: []].append(oneRepMax)
        }
        
        var exercises = [Exercise]()
        for (exerciseName, oneRepMaxes) in exerciseToOneRepMaxes {
            exercises.append(Exercise(name: exerciseName, personalRecord: getMaxPR(oneRepMaxes: oneRepMaxes), oneRepMaxes: oneRepMaxes))
        }
        
        completion(exercises)
    }
 
    func getMaxPR(oneRepMaxes: [OneRepMax]) -> Int {
        //  -1 if oneRepMaxes array is empty
        return Int(oneRepMaxes.map{ $0.weight }.max() ?? -1)
    }
    
    func getExerciseWithIndex(index: Int) -> Exercise {
        return exercises[index]
    }
}
