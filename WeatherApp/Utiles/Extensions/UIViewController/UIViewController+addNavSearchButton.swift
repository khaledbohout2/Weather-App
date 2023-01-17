//
//  UIViewController+addNavSearchButton.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 15/01/2023.
//

import UIKit

extension UIViewController {

    func addNavSearchButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "search"), for: .normal)
        let menuBarItem = UIBarButtonItem(customView: button)
        var topParent: UIViewController = self
        while topParent.parent != nil,
              String(describing: type(of: topParent.parent!.self))
                != String(describing: UINavigationController.self) {
            topParent = topParent.parent!
        }
        topParent.navigationItem.rightBarButtonItem = menuBarItem
        return button
    }
}
