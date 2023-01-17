//
//  SearchVCRouter.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import UIKit

class SearchVCRouter: BaseRouter {
    class func create(delegate: SearchVCDelegate?) -> UIViewController {
        let vCont = SearchVC()
        let repository = WeatherRepository(network: Network())
        let router = SearchVCRouter()
        let presenter = SearchVCPresenter(view: vCont, router: router, repository: repository, delegate: delegate)
        vCont.presenter = presenter
        return vCont
    }

    func remove(view: SearchVCViewProtocol?) {
        guard let vCont = view as? UIViewController, let navC = vCont.navigationController else {return}
        navC.navigationBar.isHidden = false
        vCont.remove()
    }
}
