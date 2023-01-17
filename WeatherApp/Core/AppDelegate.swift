//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 13/01/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared.enable = true
        setAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AuthLoadingVCRouter.create()
        window?.makeKeyAndVisible()

        return true
    }
}

