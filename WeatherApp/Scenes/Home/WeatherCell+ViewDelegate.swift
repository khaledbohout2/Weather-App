//
//  WeatherCell+ViewDelegate.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import Foundation

protocol WeatherCellProtocol: AnyObject {
    func dsiplayTemp(temp: String)
    func displayConditionIcon(icon: String)
    func displayDay(day: String)
}

extension WeatherCell: WeatherCellProtocol {
    func dsiplayTemp(temp: String) {
        tempLbl.text = temp
    }

    func displayConditionIcon(icon: String) {
        weatherIcon.load(with: icon)
    }

    func displayDay(day: String) {
        dayLbl.text = day
    }
}
