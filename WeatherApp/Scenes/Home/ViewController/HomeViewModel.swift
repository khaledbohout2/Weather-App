//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

import Foundation

struct HomeViewModel {
    let locationName: String
    let localTime: String
    let windMph: String
    let humidity: String
    let conditionText: String
    let conditionIcon: String
    let temp: String

    init(homeData: BaseModel) {
        self.locationName = homeData.location?.name ?? ""
        self.localTime = homeData.location?.localtime?.toDate()?.toString(format: "EEEE, MMM d, yyyy") ?? ""
        self.windMph = "\(homeData.current?.windMph ?? 0.0)" + " mph"
        self.humidity = "\(homeData.current?.humidity ?? 0.0)" + "%"
        self.conditionText = "It’s a \(homeData.current?.condition?.text ?? "") day."
        self.conditionIcon = homeData.current?.condition?.icon ?? ""
        self.temp = "\(homeData.current?.tempF ?? 0.0)" + "°F"
    }
}
