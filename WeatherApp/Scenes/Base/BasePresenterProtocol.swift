//
//  BasePresenterProtocol.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import Foundation

protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func handleRequestResponse<U: BaseCodable>(_ result: AFResult<U>,
                                               inView view: BaseViewProtocol?,
                                               withRouter router: BaseRouter?,
                                               hideLoading: Bool?) -> U?
}

extension BasePresenterProtocol {

    func handleRequestResponse<U: BaseCodable>(_ result: AFResult<U>,
                                               inView view: BaseViewProtocol?,
                                               withRouter router: BaseRouter?,
                                               hideLoading: Bool? = true) -> U? {
        if hideLoading == true { view?.stopLoading() }
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            view?.showSelfDismissingAlert(error.localizedDescription)
            return nil
        }
    }

    func handleRequestResponse<U>(_ result: AFResult<U>,
                                  inView view: BaseViewProtocol?,
                                  withRouter router: BaseRouter?,
                                  hideLoading: Bool? = true) -> U? {
        if hideLoading == true { view?.stopLoading() }
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            view?.showSelfDismissingAlert(error.localizedDescription)
            return nil
        }
    }

}
