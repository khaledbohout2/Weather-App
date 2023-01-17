//
//  UICollectionViewCell+identifier.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 15/01/2023.
//

import UIKit

extension UICollectionViewCell {
     static var identifier: String {
         return String(describing: self)
     }
 }
