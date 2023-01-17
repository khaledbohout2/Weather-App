//
//  HomeView.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 13/01/2023.
//

import UIKit

class HomeView: BaseView {

    lazy var backGroundImageView: UIImageView = {
        let image = UIImage(named: "Background")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .appMidnightBlue.withAlphaComponent(0.83)
        return view
    }()

    lazy var cityNameLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 32)
        return label
    }()

    lazy var dateLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 16)
        return label
    }()

    lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()

    lazy var tepmLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 56)
        return label
    }()

    lazy var weatherConditionLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 16)
        return label
    }()

    lazy var windIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "wind"))
        return image
    }()

    lazy var windLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 12)
        return label
    }()

    lazy var dropletIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "droplet"))
        return image
    }()

    lazy var dropletLbl: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .SFProDisplay(.regular, size: 12)
        return label
    }()

    lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.isScrollEnabled = false
        collection.isUserInteractionEnabled = false
        collection.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.identifier)
        return collection
    }()

    override func setupView() {
        super.setupView()

        addSubview(backGroundImageView)
        backGroundImageView.fillSuperview()

        addSubview(overlayView)
        overlayView.fillSuperview()

        addSubview(cityNameLbl)
        cityNameLbl.anchor(.top(topAnchor, constant: 100),
                           .centerX(centerXAnchor))

        addSubview(dateLbl)
        dateLbl.anchor(.top(cityNameLbl.bottomAnchor, constant: 4),
                           .centerX(centerXAnchor))

        addSubview(weatherIcon)
        weatherIcon.anchor(.width(70),
                           .height(70),
                           .top(dateLbl.bottomAnchor, constant: 100),
                           .centerX(centerXAnchor))

        addSubview(tepmLbl)
        tepmLbl.anchor(.centerX(centerXAnchor),
                       .top(weatherIcon.bottomAnchor, constant: 20))

        addSubview(weatherConditionLbl)
        weatherConditionLbl.anchor(.centerX(centerXAnchor),
                                   .top(tepmLbl.bottomAnchor, constant: 20))

        addSubview(windIcon)
        windIcon.anchor(.top(weatherConditionLbl.bottomAnchor, constant: 22),
                        .width(16),
                        .height(16),
                        .leading(leadingAnchor, constant: 110))

        addSubview(windLbl)
        windLbl.anchor(.centerY(windIcon.centerYAnchor),
                       .leading(windIcon.trailingAnchor, constant: 10))

        addSubview(dropletLbl)
        dropletLbl.anchor(.trailing(trailingAnchor, constant: 110),
                       .centerY(windIcon.centerYAnchor))

        addSubview(dropletIcon)
        dropletIcon.anchor(.centerY(dropletLbl.centerYAnchor),
                       .trailing(dropletLbl.leadingAnchor, constant: 10))

        addSubview(weatherCollectionView)
        weatherCollectionView.anchor(.bottom(bottomAnchor, constant: 120),
                                     .leading(leadingAnchor, constant: 20),
                                     .trailing(trailingAnchor, constant: 20),
                                     .height(50))
    }

    func setDelegates(_ delegate: Any) {
        weatherCollectionView.delegate = delegate as? UICollectionViewDelegate
        weatherCollectionView.dataSource = delegate as? UICollectionViewDataSource
    }

}
