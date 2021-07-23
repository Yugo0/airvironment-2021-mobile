//
//  MainScreenViewController.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MainScreenViewController: BaseViewController<MainScreenViewModel> {
    
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var pollutionValue: UILabel!
    
    @IBAction func showHistoryButtonTapped(_ sender: UIButton) {
        navigationController!.show(MeasurementHistoryScreenViewController(), sender: nil)
    }
    
    private var nameObserver: [NSKeyValueObservation]!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = MainScreenViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    func observeLiveData() {
        nameObserver = [viewModel.observe(\.measurement, options: .new) { _, measurement  in
            if let measurement = measurement.newValue {
                self.dateValue.text = ViewUtils.formatDate(date: measurement!.created, format: "yyyy-MM-dd HH:mm:ss")
                self.temperatureValue.text = String(measurement!.temperature)
                self.humidityValue.text = String(measurement!.humidity)
                self.pollutionValue.text = String(measurement!.pollution)
            }
        }]
    }
}
