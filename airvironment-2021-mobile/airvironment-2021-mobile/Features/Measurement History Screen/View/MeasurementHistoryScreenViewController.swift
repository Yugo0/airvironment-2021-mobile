//
//  MeasurementHistoryScreenViewController.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryScreenViewController: UIViewController {

    @IBOutlet weak var historyTableView: UITableView!
    
    let viewModel: MeasurementHistoryScreenViewModel = MeasurementHistoryScreenViewModel(repository: RepositoryImplementation())
    
    private var nameObserver: [NSKeyValueObservation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.register(UINib(nibName: MeasurementHistoryTableViewCell.reusableIdentifier(), bundle: nil), forCellReuseIdentifier: MeasurementHistoryTableViewCell.reusableIdentifier())
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    private func observeLiveData() {
        nameObserver = [viewModel.observe(\.measurements, options: .new) { _, measurements  in
            if let measurements = measurements.newValue {
                self.historyTableView.dataSource = self
//                self.historyTableView.delegate = self
            }
        }]
    }
}

extension MeasurementHistoryScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.measurements?.response.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasurementHistoryTableViewCell.reusableIdentifier(), for: indexPath) as! MeasurementHistoryTableViewCell
        if let measurements = viewModel.measurements?.response {
            cell.configure(measurement: measurements[indexPath.row])
        }
        
        return cell
    }
}
