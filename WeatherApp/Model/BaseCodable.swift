//
//  BaseCodable.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Foundation

protocol BaseCodable: Codable {
    var error: ErrorClass? { get set }
    var current: Current? { get set }
    var location: Location? { get set }
    var forecast: Forecast? { get set }
}

struct BaseModel: BaseCodable {
    var error: ErrorClass?
    var current: Current?
    var location: Location?
    var forecast: Forecast?

    enum CodingKeys: String, CodingKey {
        case error
        case current
        case location
        case forecast
    }
}

struct BaseModelWithData<T: Codable>: BaseCodable {
    var error: ErrorClass?
    var current: Current?
    var location: Location?
    var forecast: Forecast?

    enum CodingKeys: String, CodingKey {
        case error, current, location, forecast
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try? container.decode(ErrorClass.self, forKey: .error)
        current = try? container.decode(Current.self, forKey: .current)
        location = try? container.decode(Location.self, forKey: .location)
        forecast = try? container.decode(Forecast.self, forKey: .forecast)
    }
}

// MARK: - ErrorClass
struct ErrorClass: Codable {
    let code: Int?
    let message: String?
}
