//
//  WeatherNetworkRouter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Alamofire

enum WeatherNetworkRouter: URLRequestConvertible {
    case getForcast(city: String)
    case autocomplete(text: String)

    var method: HTTPMethod {
        switch self {
        case .getForcast:
            return .get
        case .autocomplete:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getForcast(let city):
            return ["key": "cf9f2da5f249454ab9b194348231601", "q": city, "days": "3"]
        case .autocomplete(let text):
            return ["key": "cf9f2da5f249454ab9b194348231601", "q": text]
        }
    }

    var url: URL {
        return URL(string: "\(Constants.baseUrl)/")!
            .appendingPathComponent(path)
    }

    var path: String {
        switch self {
        case .getForcast:
            return "forecast.json"
        case .autocomplete:
            return "search.json"
        }
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }

}
