//
//  OneRepMaxView.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/23/24.
//

import UIKit

class OneRepMaxView: UIView {
    
    var stackView = UIStackView()
    var exerciseLabel = UILabel()
    var oneRepMaxLabel = UILabel()
    var oneRepMaxWeightLabel = UILabel()
    
    var viewModel: OneRepMaxViewModel? {
        didSet {
            exerciseLabel.text = viewModel?.exerciseName
            oneRepMaxWeightLabel.text = viewModel?.weight
            oneRepMaxLabel.text = viewModel?.detailLabel
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setUpUI() {
        backgroundColor = Constants.AppColor.backgroundColor
        exerciseLabel.font = UIFont.boldSystemFont(ofSize: 25)
        oneRepMaxWeightLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        oneRepMaxWeightLabel.textColor = .white
        oneRepMaxLabel.textColor = .lightGray
        exerciseLabel.textColor = .white
        
        addSubview(stackView)
        addSubview(oneRepMaxWeightLabel)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.addArrangedSubview(exerciseLabel)
        stackView.addArrangedSubview(oneRepMaxLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        oneRepMaxWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideMarginPadding),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.sideMarginPadding),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.sideMarginPadding),
            oneRepMaxWeightLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.sideMarginPadding),
            oneRepMaxWeightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.sideMarginPadding),
            
        ])
    }
}
