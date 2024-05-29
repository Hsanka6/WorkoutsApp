//
//  ExerciseDetailViewModelTests.swift
//  FitbodTests
//
//  Created by Haasith Sanka on 5/27/24.
//

import XCTest
@testable import Fitbod

class ExerciseDetailViewModelTests: XCTestCase {

    var viewModel: ExerciseDetailViewModel!

    override func setUpWithError() throws {
        super.setUp()
        let oneRepMaxes = [
            OneRepMax(id: "1", weight: 100, date: DateFormatter().convertDateStringToDate(date: "Aug 11 2022") ?? Date()),
            OneRepMax(id: "2", weight: 120, date: DateFormatter().convertDateStringToDate(date: "Aug 11 2022") ?? Date()),
            OneRepMax(id: "3", weight: 110, date: DateFormatter().convertDateStringToDate(date: "Aug 11 2022") ?? Date())
        ]
        let exercise = Exercise(name: "Deadlift", personalRecord: 120, oneRepMaxes: oneRepMaxes)
        viewModel = ExerciseDetailViewModel(exercise: exercise)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }

    func testSetOneRepMaxGraphViewModel() {
        let graphViewModel = viewModel.setOneRepMaxGraphViewModel()

        XCTAssertEqual(graphViewModel.exerciseName, "Deadlift")
        XCTAssertEqual(graphViewModel.detailLabel, Constants.oneRepMaxLabelText)
        XCTAssertEqual(graphViewModel.weight, "120")
    }

    func testGetMaxOneRepMaxPerDay() {
        let maxOneRepMaxes = viewModel.getOneRepMaxPerDay()

        XCTAssertEqual(maxOneRepMaxes.count, 1)
        XCTAssertEqual(maxOneRepMaxes[0].weight, 120)
    }
    
    func testGetMaxOneRepMaxForGraph() {
        let oneRepMaxes = viewModel.getOneRepMaxPerDay()
        let max = viewModel.getMaxValueForGraph(oneRepMaxes: oneRepMaxes)

        XCTAssertEqual(max, 120)
    }
    
    func testGetMinOneRepMaxForGraph() {
        let oneRepMaxes = viewModel.getOneRepMaxPerDay()
        let min = viewModel.getMinValueForGraph(oneRepMaxes: oneRepMaxes)

        XCTAssertEqual(min, 110)
    }
    
    func testGetBeginningDateForGraph() {
        let oneRepMaxes = viewModel.getOneRepMaxPerDay()
        let beginningDate = viewModel.getBeginningDateForGraph(oneRepMaxes: oneRepMaxes)

        XCTAssertEqual(beginningDate, DateFormatter().convertDateStringToDate(date: "Aug 01 2022") )
    }
    
    func testGetEndingDateForGraph() {
        let oneRepMaxes = viewModel.getOneRepMaxPerDay()
        let endingDate = viewModel.getEndingDateForGraph(oneRepMaxes: oneRepMaxes)

        XCTAssertEqual(endingDate, DateFormatter().convertDateStringToDate(date: "Aug 30 2022"))
    }
}


