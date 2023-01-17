//
//  BaseVC.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import UIKit

class BaseVC<T: BaseView>: UIViewController {

    final var mainView = T()

    override func loadView() {
        super.loadView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
