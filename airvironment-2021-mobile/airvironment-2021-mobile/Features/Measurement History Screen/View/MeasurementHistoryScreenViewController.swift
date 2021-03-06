//
//  MeasurementHistoryScreenViewController.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryScreenViewController: BaseViewController<MeasurementHistoryScreenViewModel> {

    @IBOutlet weak var historyTableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = MeasurementHistoryScreenViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                self.historyTableView.reloadData()
//                self.historyTableView.delegate = self
            }
        }]
    }
}

extension MeasurementHistoryScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.measurements?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MeasurementHistoryTableViewCell.reusableIdentifier(), for: indexPath) as! MeasurementHistoryTableViewCell
        if let measurements = viewModel.measurements {
            cell.configure(measurement: measurements[indexPath.row])
        }
        
        if (indexPath.row == viewModel.measurements.count - 1) {
            viewModel.updateMeasurements()
        }
        
        return cell
    }
}
