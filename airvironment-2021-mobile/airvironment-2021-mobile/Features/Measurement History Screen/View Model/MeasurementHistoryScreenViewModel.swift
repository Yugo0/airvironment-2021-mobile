//
//  MeasurementHistoryScreenViewModel.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryScreenViewModel: NSObject {
    
    var repository: Repository
    @objc dynamic var measurements: MeasurementCollection?

    init(repository: Repository){
        self.repository = repository
    }

    func onViewDidLoad(){
        getMeasurements()
    }

    private func getMeasurements() {
        repository.getMeasurements() { result in
            switch result {
            case .success(let measurements):
                self.measurements = measurements
            case .failure(let error):
                break
            }
        }
    }
}

