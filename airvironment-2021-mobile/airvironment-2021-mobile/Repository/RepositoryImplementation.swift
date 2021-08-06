//
//  RepositoryImplementation.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class RepositoryImplementation: Repository {
    
    var webRemoteDataSource: RemoteDataSource = AlamofireDataSource()
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void)) {
        webRemoteDataSource.getLatestMeasurement(result: result)
    }
    
    func getMeasurements(meta: Meta, result: @escaping ((Result<MeasurementCollection, Error>) -> Void)) {
        webRemoteDataSource.getMeasurements(meta: meta, result: result)
    }
}

