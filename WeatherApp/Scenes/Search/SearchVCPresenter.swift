//
//  SearchVCPresenter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import UIKit

protocol SearchVCDelegate: AnyObject {
    func didSelectCity(city: String)
}

protocol SearchVCPresenterProtocol: BasePresenterProtocol {
    func textFieldDidChangeSelection(text: String?)
    func getCitiesCount() -> Int
    func configure(cell: SearchCellProtocol, for index: Int)
    func didSelectCell(at index: Int)
}

class SearchVCPresenter: SearchVCPresenterProtocol {

    private weak var view: SearchVCViewProtocol?
    private let router: SearchVCRouter
    private let repository: WeatherRepositoryProtocol

    private weak var delegate: SearchVCDelegate?

    private var cities = [City]() {
        didSet {
            view?.fetchingDataSuccess()
        }
    }

    init(view: SearchVCViewProtocol?,
         router: SearchVCRouter,
         repository: WeatherRepositoryProtocol,
         delegate: SearchVCDelegate?) {
        self.view = view
        self.router = router
        self.repository = repository
        self.delegate = delegate
    }

    func viewDidLoad() {

    }

    func getCitiesCount() -> Int {
        return cities.count
    }

    func configure(cell: SearchCellProtocol, for index: Int) {
        cell.displayCityName(title: "\(cities[index].name ?? "") - \(cities[index].region ?? "")")
    }

    func didSelectCell(at index: Int) {
        delegate?.didSelectCity(city: cities[index].name ?? "")
        router.remove(view: view)
    }

    func textFieldDidChangeSelection(text: String?) {
        guard let text = text,
              text != "" else {
            self.cities.removeAll()
            return
        }
        repository.autocomplete(text: text) { [weak self] response in
            guard let self = self else {return}
            self.cities.removeAll()
            guard let data = self.handleRequestResponse(response,
                                                        inView: self.view,
                                                        withRouter: self.router) else {return}
            self.cities = data
        }
    }

}
