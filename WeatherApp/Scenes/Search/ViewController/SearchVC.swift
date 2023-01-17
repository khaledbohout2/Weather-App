//
//  SearchVC.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import UIKit

protocol SearchVCViewProtocol: BaseViewProtocol {
    var presenter: SearchVCPresenterProtocol! { get set }
    func fetchingDataSuccess()
}

class SearchVC: BaseVC<SearchView>, UITextFieldDelegate {
    var presenter: SearchVCPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        mainView.setDelegates(self)
        addBtnsTargets()
        navigationController?.navigationBar.isHidden = true
    }

    func addBtnsTargets() {
        mainView.dismissBtn.addTarget { [weak self] in
            self?.mainView.searchTextField.text = ""
        }
        mainView.clearTextFieldBtn.addTarget { [weak self] in
            self?.mainView.searchTextField.text = ""
        }
        mainView.backBtn.addTarget { [weak self] in
            self?.navigationController?.navigationBar.isHidden = false
            self?.remove()
        }
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        presenter.textFieldDidChangeSelection(text: textField.text)
    }

}
