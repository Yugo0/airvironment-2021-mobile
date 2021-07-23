//
//  ViewUtils.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 23.7.21..
//

import UIKit

class ViewUtils {

    static func getKeyWindow() -> UIWindow? {
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.makeKeyAndVisible()
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
    
    static func formatDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
