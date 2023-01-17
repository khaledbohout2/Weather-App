//
//  SearchCell.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import UIKit

class SearchCell: UITableViewCell {

    lazy var cityLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .appFirod
        lbl.font = .SFProDisplay(.regular, size: 16)
        lbl.numberOfLines = 1
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupLayout()
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        addSubview(cityLbl)
        cityLbl.anchor(.top(topAnchor, constant: 12),
                       .bottom(bottomAnchor, constant: 12),
                       .leading(leadingAnchor, constant: 32),
                       .trailing(trailingAnchor, constant: 32))
    }
}
