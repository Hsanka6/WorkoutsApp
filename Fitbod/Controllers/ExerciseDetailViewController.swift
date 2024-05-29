//
//  WorkoutDetailViewController.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/20/24.
//

import UIKit
import SwiftUI

class ExerciseDetailViewController: UIViewController {
    var oneRepMaxView = OneRepMaxView()
    var viewModel: ExerciseDetailViewModel
    
    
    init(viewModel: ExerciseDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setCustomBackButtonImage()
    }
    
    private func setCustomBackButtonImage() {
       self.navigationItem.backButtonTitle = ""
       let backButtonImage = UIImage(named: "BackCaret")?.withRenderingMode(.alwaysOriginal)
       let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
       self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUpUI() {
        oneRepMaxView.viewModel = viewModel.setOneRepMaxGraphViewModel()
        let oneRepMaxes = viewModel.getOneRepMaxPerDay()
        let minYAxis = viewModel.getMinValueForGraph(oneRepMaxes: oneRepMaxes)
        let maxYAxis = viewModel.getMaxValueForGraph(oneRepMaxes: oneRepMaxes)
        let minXAxis:Date = viewModel.getBeginningDateForGraph(oneRepMaxes: oneRepMaxes)
        let maxXAxis:Date = viewModel.getEndingDateForGraph(oneRepMaxes: oneRepMaxes)
        
        let oneRepMaxChart = OneRepMaxGraphView(data: oneRepMaxes, minYAxis: minYAxis, maxYAxis: maxYAxis, minXAxis: minXAxis, maxXAxis: maxXAxis)
        let hostingController = UIHostingController(rootView: oneRepMaxChart)
        hostingController.view.backgroundColor = Constants.AppColor.backgroundColor
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        hostingController.didMove(toParent: self)
        
        view.addSubview(oneRepMaxView)
        oneRepMaxView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.AppColor.backgroundColor
        
        NSLayoutConstraint.activate([
            oneRepMaxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oneRepMaxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            oneRepMaxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: oneRepMaxView.bottomAnchor),
        ])
    }

}
