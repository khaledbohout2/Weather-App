//
//  HomeVCRouter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 13/01/2023.
//

import UIKit

class HomeVCRouter: BaseRouter {
    class func create() -> UIViewController {
        let vCont = HomeVC()
        let router = HomeVCRouter()
        let repository = WeatherRepository(network: Network())
        let presenter = HomeVCPresenter(view: vCont,
                                        router: router,
                                        repository: repository)
        vCont.presenter = presenter
        return vCont
    }

    func addSearchVC(view: HomeVCProtocol, delegate: SearchVCDelegate?) {
        guard let vCont = view as? UIViewController else {return}
        let searchVC = SearchVCRouter.create(delegate: delegate)
        vCont.add(searchVC, frame: vCont.view.frame)
    }
}
