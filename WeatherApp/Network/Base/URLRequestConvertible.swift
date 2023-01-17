//
//  URLRequestConvertible.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
