//
//  WeatherForeCast.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 16/01/2023.
//

// MARK: - Location
struct Location: Codable {
    let name: String?
    let localtime: String?
}

// MARK: - WeatherForCast
struct WeatherForCast: Codable {
    let current: Current?
}

// MARK: - Current
struct Current: Codable {

    let condition: Condition?
    let windMph, humidity, tempF: Double?

    enum CodingKeys: String, CodingKey {
        case condition
        case windMph = "wind_mph"
        case humidity
        case tempF = "temp_f"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let icon: String?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let day: Day?
}

// MARK: - Day
struct Day: Codable {
    let maxtempF, mintempF: Double?
    let condition: Condition?

    enum CodingKeys: String, CodingKey {
        case maxtempF = "maxtemp_f"
        case mintempF = "mintemp_f"
        case condition
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - City
struct City: Codable {
    let name: String?
    let region: String?
}
