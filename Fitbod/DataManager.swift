//
//  DataManager.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/17/24.
//

import Foundation

protocol DataService {
    func readCSV(fileName: String) -> String?
    func parseCSVToWorkouts(contents: String) -> [Workout]
    func loadWorkoutsFromCSV(fileName: String) -> [Workout]?
}

class DataManager: DataService {
    
    func readCSV(fileName: String) -> String? {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") else {
            return nil
        }
        do {
            let contents = try String(contentsOfFile: filePath)
            return contents
        } catch {
            print("Error reading file: \(error.localizedDescription)")
            return nil
        }
    }
    
    func parseCSVToWorkouts(contents: String) -> [Workout] {
        var result: [[String]] = []
        var workouts: [Workout] = []
        let rows = contents.split(separator: "\n")
        
        for row in rows {
            let columns = row.split(separator: ",").map { String($0) }
            result.append(columns)
        }
        
        for (_, row) in result.enumerated() {
            let oneRepMax = Double().calculateOneRepMax(weight: Double(row[3]) ?? 0, reps: Int(row[2]) ?? 0)
            let workout = Workout(date: row[0], exercise: row[1], reps: Int(row[2]) ?? 0, weight: Int(row[3]) ?? 0, oneRepMaxWeight: oneRepMax)
            workouts.append(workout)
        }
        
        return workouts
    }
    
    
    func loadWorkoutsFromCSV(fileName: String) -> [Workout]? {
        guard let contents = readCSV(fileName: fileName) else {
            return nil
        }
        
        let workouts = parseCSVToWorkouts(contents: contents)
        
        return workouts
    }
    
}
