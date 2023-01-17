//
//  HomeVCPresenter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Foundation

protocol HomeVCPresenterProtocol: BasePresenterProtocol {
    func getDaysCount() -> Int
    func configure(cell: WeatherCellProtocol, for index: Int)
    func addSearchVC()
}

class HomeVCPresenter: HomeVCPresenterProtocol, SearchVCDelegate {

    private weak var view: HomeVCProtocol?
    private let router: HomeVCRouter
    private let repository: WeatherRepositoryProtocol

    var city = "Cairo"

    private var foreCastDays = [Forecastday]() {
        didSet {
            view?.fetchingDataSuccess()
        }
    }

    init(view: HomeVCProtocol?,
         router: HomeVCRouter,
         repository: WeatherRepositoryProtocol) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    func viewDidLoad() {
        view?.setCenterNavTitle(Date().toString() ?? "")
        getForeCast()
    }

    func getDaysCount() -> Int {
        return foreCastDays.count
    }

    func configure(cell: WeatherCellProtocol, for index: Int) {
        cell.displayConditionIcon(icon: foreCastDays[index].day?.condition?.icon ?? "")
        cell.dsiplayTemp(temp: "\(foreCastDays[index].day?.mintempF ?? 0.0)°/\(foreCastDays[index].day?.maxtempF ?? 0.0)°F")

        cell.displayDay(day: foreCastDays[index].date?.toDate(format: "yyyy-mm-dd")?.relativeDateFormatter()?
            .toDate(format: "MMM d, yyyy")?.toString(format: "EEEE") ??
                        foreCastDays[index].date?.toDate(format: "yyyy-mm-dd")?.relativeDateFormatter() ?? "")
    }

    func getForeCast() {
        view?.startLoading(message: nil)
        repository.getForecast(city: city) { [weak self] response in
            guard let self = self else {return}
            guard let data = self.handleRequestResponse(response,
                                                        inView: self.view,
                                                        withRouter: self.router) else {return}
            self.view?.stopLoading()
            self.view?.updateUI(home: HomeViewModel(homeData: data))
            self.foreCastDays = data.forecast?.forecastday ?? []
        }
    }

    func didSelectCity(city: String) {
        self.city = city
        getForeCast()
    }

    func addSearchVC() {
        guard let view = self.view else {return}
        router.addSearchVC(view: view, delegate: self)
    }

}
