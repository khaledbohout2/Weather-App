//
//  HomeVC+ViewProtocol.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Foundation

extension HomeVC: HomeVCProtocol {
    func updateUI(home: HomeViewModel) {
        mainView.cityNameLbl.text = home.locationName
        mainView.dateLbl.text = home.localTime
        mainView.tepmLbl.text = home.temp
        mainView.windLbl.text = home.windMph
        mainView.dropletLbl.text = home.humidity
        mainView.weatherIcon.load(with: home.conditionIcon)
        mainView.weatherConditionLbl.text = home.conditionText
    }

    func fetchingDataSuccess() {
        mainView.weatherCollectionView.reloadData()
    }
}
