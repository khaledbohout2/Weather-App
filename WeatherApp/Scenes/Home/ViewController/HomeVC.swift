//
//  HomeVC.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 13/01/2023.
//

import UIKit

protocol HomeVCProtocol: BaseViewProtocol {
    var presenter: HomeVCPresenterProtocol! { get set }
    func updateUI(home: HomeViewModel)
    func fetchingDataSuccess()
}

class HomeVC: BaseVC<HomeView> {
    var presenter: HomeVCPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        mainView.setDelegates(self)
        addNavSearchButton().addTarget {[weak self] in
            self?.presenter.addSearchVC()
        }
    }
}
