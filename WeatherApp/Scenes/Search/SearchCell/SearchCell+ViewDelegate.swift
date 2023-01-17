//
//  SearchCell+ViewDelegate.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import Foundation

protocol SearchCellProtocol: AnyObject {
    func displayCityName(title: String)
}

extension SearchCell: SearchCellProtocol {
    func displayCityName(title: String) {
        cityLbl.text = title
    }
}
