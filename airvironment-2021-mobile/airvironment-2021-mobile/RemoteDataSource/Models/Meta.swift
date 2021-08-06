//
//  Meta.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 22.7.21..
//

import UIKit

class Meta: NSObject, Codable {
    
    var page: Int
    var perPage: Int
    var total: Int?
    
    init(page: Int, perPage: Int, total: Int?) {
        self.page = page
        self.perPage = perPage
        self.total = total
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
    }
}
