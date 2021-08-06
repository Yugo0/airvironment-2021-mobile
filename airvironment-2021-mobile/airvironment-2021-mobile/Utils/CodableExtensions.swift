//
//  CodableExtensions.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 23.7.21..
//

import UIKit

extension Encodable {
    func encode() throws -> [String: Any]? {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}

extension JSONDecoder {
    static func dateDecodingStrategy(_ decoder: Decoder) throws -> Date {
        let dateString = try decoder.singleValueContainer().decode(String.self)
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            return date
        } else {
            let dateFormats = ["yyyy-MM-dd'T'HH:mm:ss'Z'",
                               "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZZZZZ"]
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            for format in dateFormats {
                formatter.dateFormat = format
                if let date = formatter.date(from: dateString) {
//                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//                    let newDateString = formatter.string(from: date)
//                    return formatter.date(from: newDateString)!
                    return date
                }
            }
            let dateKey = decoder.codingPath.last!
            let error = NSError(domain: String(describing: Self.self), code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected date format \(dateString) for coding key: \(dateKey.stringValue)"])
            throw (error)
        }
    }
}
