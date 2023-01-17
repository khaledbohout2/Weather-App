//
//  String+relativeDateFormatter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import Foundation

extension String {
    func relativeDateFormatter() -> String {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .medium
        relativeDateFormatter.locale = Locale(identifier: "en_GB")
        relativeDateFormatter.doesRelativeDateFormatting = true
    }
}
