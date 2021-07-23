//
//  AlamofireDataSource.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit
import Alamofire

class AlamofireDataSource: RemoteDataSource {
    
    func getLatestMeasurement(result: @escaping ((Result<Measurement, Error>) -> Void)) {
        AF.request(Router.Measurement.getLatestMeasurement, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: Measurement = try jsonDecoder.decode(Measurement.self, from: serverResponse.data!) as Measurement
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
    func getMeasurements(result: @escaping ((Result<MeasurementCollection, Error>) -> Void)) {
        AF.request(Router.Measurement.getMeasurements, interceptor: nil).response { serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: MeasurementCollection = try jsonDecoder.decode(MeasurementCollection.self, from: serverResponse.data!) as MeasurementCollection
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}
