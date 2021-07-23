//
//  MainScreenViewModel.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MainScreenViewModel: BaseViewModel {
    
    var repository: Repository
    @objc dynamic var measurement: Measurement?
    
    var timer: Timer!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getLatestMeasurement()
        self.timer = Timer.scheduledTimer(timeInterval: 600.0, target: self, selector: #selector(getLatestMeasurement), userInfo: nil, repeats: true)
    }
    
    @objc private func getLatestMeasurement() {
        isLoading = true
        repository.getLatestMeasurement() { result in
            switch result {
            case .success(let measurement):
                self.measurement = measurement
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
            }
        }
    }
}
