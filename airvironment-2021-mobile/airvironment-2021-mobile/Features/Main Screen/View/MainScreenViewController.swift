//
//  MainScreenViewController.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var humidityValue: UILabel!
    @IBOutlet weak var pollutionValue: UILabel!
    
    @IBAction func showHistoryButtonTapped(_ sender: UIButton) {
        navigationController!.show(MeasurementHistoryScreenViewController(), sender: nil)
    }
    
    private var nameObserver: [NSKeyValueObservation]!
    
    let viewModel: MainScreenViewModel = MainScreenViewModel(repository: RepositoryImplementation())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    func observeLiveData() {
        nameObserver = [viewModel.observe(\.measurement, options: .new) { _, measurement  in
            if let measurement = measurement.newValue {
                self.dateValue.text = measurement!.created
                self.temperatureValue.text = String(measurement!.temperature)
                self.humidityValue.text = String(measurement!.humidity)
                self.pollutionValue.text = String(measurement!.pollution)
            }
        }]
    }
}
