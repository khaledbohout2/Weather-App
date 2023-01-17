//
//   UIView+makeRounded.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 14/01/2023.
//

import UIKit

extension UIView {

    func makeRoundedCorner(cornerRadius: CGFloat,
                           borderColor: UIColor = UIColor.clear,
                           borderWidth: CGFloat = 1,
                           cornerMask: CACornerMask = [.layerMaxXMaxYCorner,
                                                       .layerMaxXMinYCorner,
                                                       .layerMinXMaxYCorner,
                                                       .layerMinXMinYCorner]) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = cornerMask
        self.clipsToBounds = true
    }
}
