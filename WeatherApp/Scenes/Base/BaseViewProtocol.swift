//
//  BaseViewProtocol.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    func startLoading(message: String?)
    func setLoadingMessage(message: String)
    func stopLoading()
    func showSelfDismissingAlert(_ message: String)
    func showSelfDismissingAlert(_ message: String, after time: TimeInterval)
    func pop()
    func pop(after: Double)
    func setCenterNavTitle(_ title: String)
}

extension BaseViewProtocol where Self: UIViewController {

    func startLoading(message: String? = nil) {
        startLoading(message: message)
    }

    func setLoadingMessage(message: String) {
        setLoadingMessage(message: message)
    }

    func stopLoading() {
        stopLoading()
    }

    func showSelfDismissingAlert(_ message: String) {
        showAlert(message: message)
    }

    func showSelfDismissingAlert(_ message: String, after time: TimeInterval) {
        showAlert(message: message, time: time)
    }

    func pop() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
        dismiss(animated: true, completion: nil)
    }

    func pop(after: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func setCenterNavTitle(_ title: String) {
        var topParent: UIViewController = self
        while topParent.parent != nil,
              String(describing: type(of: topParent.parent!.self))
                != String(describing: UINavigationController.self) {
            topParent = topParent.parent!
        }
        topParent.title = title
    }
}
