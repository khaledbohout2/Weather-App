//
//  Date+relativeDateFormatter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import Foundation

extension Date {
    func relativeDateFormatter() -> String? {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .medium
 //       relativeDateFormatter.locale = Locale(identifier: "en_GB")
        relativeDateFormatter.doesRelativeDateFormatting = true
        return relativeDateFormatter.string(from: self)
    }
}
