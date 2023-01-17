//
//  Date+toString.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 15/01/2023.
//

import Foundation

extension Date {
    func toString(format: String? = "h:mm a") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
