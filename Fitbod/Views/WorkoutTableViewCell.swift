//
//  WorkoutTableViewCell.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/19/24.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    var oneRepMaxView = OneRepMaxView()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(exercise: Exercise) {
        setUpUI()
        oneRepMaxView.viewModel = OneRepMaxViewModel(exerciseName: exercise.name, detailLabel: Constants.oneRepMaxLabelText, weight: String(exercise.personalRecord))
    }

    private func setUpUI() {
        contentView.addSubview(oneRepMaxView)
        oneRepMaxView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .black
        NSLayoutConstraint.activate([
            oneRepMaxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            oneRepMaxView.topAnchor.constraint(equalTo: contentView.topAnchor),
            oneRepMaxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            oneRepMaxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    
}
