//
//  MeasurementCollection.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class MeasurementCollection: NSObject, Codable {
    
    var meta: Meta
    var response: Array<Measurement>
    
    init(meta: Meta, response: Array<Measurement>) {
        self.meta = meta
        self.response = response
    }
    
    enum CodingKeys: String, CodingKey {
        case meta
        case response
    }
}
