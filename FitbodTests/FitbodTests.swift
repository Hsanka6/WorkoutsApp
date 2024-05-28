//
//  FitbodTests.swift
//  FitbodTests
//
//  Created by Haasith Sanka on 5/17/24.
//

import XCTest
@testable import Fitbod

final class FitbodTests: XCTestCase {
    var mockDataManager: MockDataManager!
    var mockViewModel: ExercisesTableViewModel!
    
    override func setUpWithError() throws {
        mockDataManager = MockDataManager()
        mockViewModel = ExercisesTableViewModel(dataManager: mockDataManager)
    }

    override func tearDownWithError() throws {
        mockDataManager = nil
        mockViewModel = nil
    }
    
    
    func testReadCSV() {
        let mockCSVContent = "Oct 11 2020,Back Squat,6,245"
        mockDataManager.mockCSVContent = mockCSVContent
        let result = mockDataManager.readCSV(fileName: "mockFile")
        XCTAssertEqual(result, mockCSVContent)
    }

    func testParseCSVToWorkouts() {
        let mockCSVContent = "Oct 11 2020,Back Squat,6,245"
        let expectedWorkouts = [Workout(date: "Oct 11 2020", exercise: "Back Squat", reps: 6, weight: 245, oneRepMaxWeight: 270)]
        mockDataManager.parseCSVToWorkoutsResult = expectedWorkouts
        let result = mockDataManager.parseCSVToWorkouts(contents: mockCSVContent)
        XCTAssertEqual(result, expectedWorkouts)
    }
    
    func testLoadWorkoutsFromCSV() {
        let expectedWorkouts = [Workout(date: "Oct 11 2020", exercise: "Back Squat", reps: 6, weight: 245, oneRepMaxWeight: 270)]
        mockDataManager.loadWorkoutsFromCSVResult = expectedWorkouts
        let result = mockDataManager.loadWorkoutsFromCSV(fileName: "mockFile")
        XCTAssertEqual(result, expectedWorkouts)
    }


    func testNumberOfRows() {
        mockDataManager.loadWorkoutsFromCSVResult = [
            Workout(date: "Oct 11 2020", exercise: "Deadlift", reps: 10, weight: 100, oneRepMaxWeight: 120),
            Workout(date: "Oct 12 2020", exercise: "Back Squat", reps: 8, weight: 150, oneRepMaxWeight: 170),
        ]
        mockViewModel.populateExercises(fileName: "mockFile")
        XCTAssertEqual(mockViewModel.numberOfRows, 2)
    }
    
    func testPopulateExercises() {
        mockDataManager.loadWorkoutsFromCSVResult = [
            Workout(date: "Oct 12 2020", exercise: "Back Squat", reps: 8, weight: 150, oneRepMaxWeight: 170),
            Workout(date: "Oct 12 2020", exercise: "Deadlift", reps: 12, weight: 170, oneRepMaxWeight: 190)
        ]
        
        let expectation = self.expectation(description: "Data did change")
        mockViewModel.dataDidChange = {
            expectation.fulfill()
        }
        
        mockViewModel.populateExercises(fileName: "mockFile")
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(mockViewModel.exercises.count, 2)
    }
    
    func testGetExerciseWithIndex() {
        let sampleExercises = [
            Exercise(name: "Deadlift", personalRecord: 200, oneRepMaxes: [
                OneRepMax(id: "1", weight: 200, date: DateFormatter().convertDateStringToDate(date: "Oct 12 2020") ?? Date())
            ]),
             Exercise(name: "Back Squat", personalRecord: 200, oneRepMaxes: [
                 OneRepMax(id: "2", weight: 100, date: DateFormatter().convertDateStringToDate(date: "Aug 12 2020") ?? Date())
             ])
        ]
        
        let mockDataManager = MockDataManager()
        mockDataManager.loadWorkoutsFromCSVResult = [
            Workout(date: "Oct 12 2020", exercise: "Deadlift", reps: 10, weight: 200, oneRepMaxWeight: 250),
            Workout(date: "Aug 12 2020", exercise: "Back Squat", reps: 10, weight: 100, oneRepMaxWeight: 120),
        ]
        
        let mockViewModel = ExercisesTableViewModel(dataManager: mockDataManager)
        
        mockViewModel.populateExercises(fileName: "mockFile")
        
        let exercise = mockViewModel.getExerciseWithIndex(index: 1)
        
        XCTAssertEqual(exercise.name, "Back Squat")
    }
    
    func testGetMaxPR() {
        let oneRepMaxes = [
            OneRepMax(id: "1", weight: 200, date: Date()),
            OneRepMax(id: "2", weight: 250, date: Date())
        ]
        
        let maxOneRep = mockViewModel.getMaxPR(oneRepMaxes: oneRepMaxes)
        
        XCTAssertEqual(maxOneRep, 250)
    }
    
    func testGetWorkoutsAndConvertToExercises() {
        mockDataManager.loadWorkoutsFromCSVResult = [
            Workout(date: "Oct 11 2020", exercise: "Deadlift", reps: 10, weight: 100, oneRepMaxWeight: 120),
            Workout(date: "Oct 11 2020", exercise: "Deadlift", reps: 10, weight: 110, oneRepMaxWeight: 120),
            Workout(date: "Oct 12 2020", exercise: "Back Squat", reps: 12, weight: 150, oneRepMaxWeight: 190),
        ]
        
        let expectation = self.expectation(description: "completion called")
        mockViewModel.getWorkoutsAndConvertToExercises(fileName: "mockFile") { exercises in
            XCTAssertEqual(exercises.count, 2)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    
}
