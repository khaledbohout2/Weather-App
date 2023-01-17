//
//  SearchView+ViewDelegate.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import Foundation

extension SearchVC: SearchVCViewProtocol {
    func fetchingDataSuccess(){
        mainView.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
            self?.mainView.dismissBtn.isHidden = (self?.mainView.tableView.visibleCells.count ?? 0 > 0)
            if self?.mainView.dismissBtn.isHidden ?? false {
                self?.mainView.searchView.makeRoundedCorner(cornerRadius: 30, cornerMask: [.layerMinXMaxYCorner,
                     .layerMaxXMaxYCorner])
            } else {
                self?.mainView.searchView.makeRoundedCorner(cornerRadius: 0)
            }
        }
    }
}
