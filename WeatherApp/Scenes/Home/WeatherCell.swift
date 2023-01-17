//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 15/01/2023.
//

import UIKit

class WeatherCell: UICollectionViewCell {

    lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()

    lazy var tempLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 12)
        return label
    }()

    lazy var dayLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        setupLayOut()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayOut() {
        backgroundColor = .clear
        addSubview(weatherIcon)
        weatherIcon.anchor(.centerX(centerXAnchor),
                           .width(4.5),
                           .height(4.5),
                           .top(topAnchor, constant: 0))
        addSubview(tempLbl)
        tempLbl.anchor(.centerX(centerXAnchor),
                           .top(weatherIcon.bottomAnchor, constant: 8))

        addSubview(dayLbl)
        dayLbl.anchor(.centerX(centerXAnchor),
                           .top(tempLbl.bottomAnchor, constant: 6))
    }
}
