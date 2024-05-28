//
//  ExercisesViewController.swift
//  Fitbod
//
//  Created by Haasith Sanka on 5/17/24.
//

import UIKit

class ExercisesViewController: UIViewController {
    
    var manager = DataManager()
    var viewModel: ExercisesTableViewModel
    var tableView = UITableView()
    static let cellId = "cell"
   
    init(viewModel: ExercisesTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.populateExercises(fileName: Constants.workoutFileName)
        setUpUI()
        configureViewModel()
        
    }
    
    func configureViewModel() {
        viewModel.dataDidChange = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setUpUI() {
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: ExercisesViewController.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension ExercisesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesViewController.cellId, for: indexPath) as? WorkoutTableViewCell  else { return UITableViewCell() }
        
        cell.configure(exercise: viewModel.getExerciseWithIndex(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exerciseDetailViewModel = ExerciseDetailViewModel(exercise: viewModel.getExerciseWithIndex(index: indexPath.row))
        let detailViewController = ExerciseDetailViewController(viewModel: exerciseDetailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}
