//
//  UIFont+SFProDisplay.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import UIKit

extension UIFont {

    public enum SFProDisplayType: String {
        case regular = "-Regular"
    }

    static func SFProDisplay(_ type: SFProDisplayType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "SFProDisplay\(type.rawValue)", size: size)!
    }

}
