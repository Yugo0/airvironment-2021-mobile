//
//  MainScreenViewModel.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MainScreenViewModel: NSObject {
    
    var repository: Repository
    @objc dynamic var measurement: Measurement?
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewDidLoad() {
        getLatestMeasurement()
    }
    
    private func getLatestMeasurement() {
        repository.getLatestMeasurement() { result in
            switch result {
            case .success(let measurement):
                self.measurement = measurement
            case .failure(let error):
                break
            }
        }
    }
}
