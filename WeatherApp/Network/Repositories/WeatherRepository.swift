//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Alamofire

protocol WeatherRepositoryProtocol {
    func getForecast(city: String, completionHandler: @escaping(AFResult<BaseModel>) -> Void)
    func autocomplete(text: String, completionHandler: @escaping(AFResult<[City]>) -> Void)
}
class WeatherRepository: WeatherRepositoryProtocol {

    private var network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func getForecast(city: String, completionHandler: @escaping(AFResult<BaseModel>) -> Void) {
        let route = WeatherNetworkRouter.getForcast(city: city)
        network.request(route, decodeTo: BaseModel.self, completionHandler: completionHandler)
    }

    func autocomplete(text: String, completionHandler: @escaping(AFResult<[City]>) -> Void) {
        let route = WeatherNetworkRouter.autocomplete(text: text)
        network.request(route, decodeTo: [City].self, completionHandler: completionHandler)
    }

}
