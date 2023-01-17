//
//  UIString+toDate.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import Foundation

extension String {
    func toDate(format: String? = "yyyy-MM-dd HH:SS") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
           return nil
        }
    }
}
