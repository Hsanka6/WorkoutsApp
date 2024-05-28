//
//  MockDataManager.swift
//  FitbodTests
//
//  Created by Haasith Sanka on 5/22/24.
//

import Foundation

final class MockDataManager : DataService {
    
    var mockCSVContent: String?
    var parseCSVToWorkoutsResult: [Workout] = []
    var loadWorkoutsFromCSVResult: [Workout]?
    
    func readCSV(fileName: String) -> String? {
        return mockCSVContent
    }
    
    func parseCSVToWorkouts(contents: String) -> [Workout] {
        return parseCSVToWorkoutsResult
    }
    
    func loadWorkoutsFromCSV(fileName: String) -> [Workout]? {
        return loadWorkoutsFromCSVResult
    }
    
    
}
