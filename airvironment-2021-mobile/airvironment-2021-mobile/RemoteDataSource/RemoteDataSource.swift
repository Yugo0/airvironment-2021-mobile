//
//  RemoteDataSource.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

protocol RemoteDataSource {
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void))
    func getMeasurements(meta: Meta, result: @escaping ((Result<MeasurementCollection, Error>) -> Void))
}
