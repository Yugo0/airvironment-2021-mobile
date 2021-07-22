//
//  Router.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit
import Alamofire

struct Router {
    
    public static var baseUrl: URL = URL(string: "https://airvironment.live")!
    
    enum Measurement: URLRequestConvertible {
        case getLatestMeasurement
        case getMeasurements
        
        var resource: String {
            switch self {
            case .getLatestMeasurement: return "/api/measurements/latest"
            case .getMeasurements: return "/api/measurements"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getLatestMeasurement: return .get
            case .getMeasurements: return .get
            }
        }
        
        var path: String {
            switch self {
            case .getLatestMeasurement: return resource
            case .getMeasurements: return resource
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            var request = URLRequest(url: baseUrl.appendingPathComponent(path))
            request.method = method
            
            switch self {
            case .getLatestMeasurement:
                break
            case .getMeasurements:
                break
            }
            
            return request
        }
    }
}
