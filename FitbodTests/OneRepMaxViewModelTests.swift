//
//  OneRepMaxViewModelTests.swift
//  FitbodTests
//
//  Created by Haasith Sanka on 5/27/24.
//

import XCTest
@testable import Fitbod


class OneRepMaxViewModelTests: XCTestCase {

    var viewModel: OneRepMaxViewModel!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = OneRepMaxViewModel(exerciseName: "Deadlift", detailLabel: Constants.oneRepMaxLabelText, weight: "120")
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }


    func testSetOneRepMaxGraphViewModel() {
        XCTAssertEqual(viewModel.exerciseName, "Deadlift")
        XCTAssertEqual(viewModel.detailLabel, Constants.oneRepMaxLabelText)
        XCTAssertEqual(viewModel.weight, "120")
    }
}

