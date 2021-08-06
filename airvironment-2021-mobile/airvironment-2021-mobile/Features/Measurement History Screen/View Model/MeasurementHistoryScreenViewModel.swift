//
//  MeasurementHistoryScreenViewModel.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementHistoryScreenViewModel: BaseViewModel {
    
    var repository: Repository
    @objc dynamic var measurements: Array<Measurement>!
    var page: Int! = 1
    var perPage: Int! = 5
    var total: Int!

    init(repository: Repository){
        self.repository = repository
    }

    func onViewDidLoad(){
        getMeasurements()
    }
    
    func updateMeasurements() {
        self.page += 1
        self.getMeasurements()
    }

    private func getMeasurements() {
        isLoading = true
        repository.getMeasurements(meta: Meta(page: page, perPage: perPage, total: nil)) { result in
            switch result {
            case .success(let measurements):
                if self.measurements == nil {
                    self.measurements = []
                }
                self.measurements.append(contentsOf: measurements.response)
                self.page = measurements.meta.page
                self.perPage = measurements.meta.perPage
                self.total = measurements.meta.total
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
            }
        }
    }
}

