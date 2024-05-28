//
//  Constants.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/21/24.
//

import UIKit
import SwiftUI

struct Constants {
    
    struct AppColor {
        static let primaryColor: UIColor = .white
        static let secondaryColor: UIColor = .lightGray
        static let backgroundColor: UIColor = .black
    }
    
    static let workoutFileName: String = "workoutData"
    
    static let dateFormat: String = "MMM dd yyyy"
    
    static let oneRepMaxLabelText: String = "One Rep Max \u{2022} lbs"
    
    static let sideMarginPadding: CGFloat = 20.0
    
    struct ChartConstants {
        static let xAxis: String = "Date"
        static let yAxis: String = "Weight"
    }
}
