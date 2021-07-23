//
//  MeasurementHistoryScreenViewModel.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryScreenViewModel: BaseViewModel {
    
    var repository: Repository
    @objc dynamic var measurements: MeasurementCollection?

    init(repository: Repository){
        self.repository = repository
    }

    func onViewDidLoad(){
        getMeasurements()
    }

    private func getMeasurements() {
        isLoading = true
        repository.getMeasurements() { result in
            switch result {
            case .success(let measurements):
                self.measurements = measurements
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
            }
        }
    }
}

