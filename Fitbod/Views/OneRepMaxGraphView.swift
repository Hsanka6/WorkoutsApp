//
//  OneRepMaxGraphView.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/20/24.
//

import SwiftUI
import Charts

struct OneRepMaxGraphView: View {
    var data: [OneRepMax]
    var minYAxis: Int
    var maxYAxis: Int
    var minXAxis: Date
    var maxXAxis: Date

    var body: some View {
        VStack {
            Chart {
                ForEach(data) { max in
                    LineMark(
                        x: .value(Constants.ChartConstants.xAxis, max.date),
                        y: .value(Constants.ChartConstants.yAxis, max.weight)
                    )
                    .foregroundStyle(Color(Constants.AppColor.primaryColor))
                    .interpolationMethod(.linear)
                    
                    PointMark(
                        x: .value(Constants.ChartConstants.xAxis, max.date),
                        y: .value(Constants.ChartConstants.yAxis, max.weight)
                    )
                    .symbol {
                        Circle()
                            .foregroundColor(Color(Constants.AppColor.backgroundColor))
                            .frame(width: 10, height: 10)
                    }
                    
                    PointMark(
                        x: .value(Constants.ChartConstants.xAxis, max.date),
                        y: .value(Constants.ChartConstants.yAxis, max.weight)
                    )
                    .symbol {
                        Circle()
                            .strokeBorder(lineWidth: 2)
                            .foregroundColor(Color(Constants.AppColor.primaryColor))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month, count: 2)) { value in
                    if let dateValue = value.as(Date.self) {
                        AxisGridLine()
                        AxisTick()
                        AxisValueLabel {
                            Text(dateValue, format: .dateTime.month(.abbreviated).day())
                                .foregroundColor(Color(Constants.AppColor.primaryColor))
                                .fontWeight(dateValue.endOfMonth() == maxXAxis ? .bold : .regular)
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(values: .automatic) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                        .foregroundStyle(Color(Constants.AppColor.primaryColor))
                }
            }
            .chartYScale(domain: minYAxis...maxYAxis)
            .padding(EdgeInsets(top: 10, leading: Constants.sideMarginPadding, bottom: 0, trailing: Constants.sideMarginPadding))
            .frame(height: 300)
            .chartXScale(domain: minXAxis...maxXAxis)
        }
        .background(Color(Constants.AppColor.backgroundColor))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OneRepMaxGraphView(data: [
        OneRepMax(id: "0", weight: 100, date: Date()),
        OneRepMax(id: "1", weight: 200, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!),
        OneRepMax(id: "2", weight: 300, date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!)
    ], minYAxis: 0, maxYAxis: 400, minXAxis: Date(), maxXAxis: Date())
}
