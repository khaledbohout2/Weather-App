//
//  SearchView.swift
//  WeatherApp
//
//  Created by Khaled Bohout on 17/01/2023.
//

import UIKit

class SearchView: BaseView {

    let contView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.makeRoundedCorner(cornerRadius: 30, cornerMask: [.layerMinXMaxYCorner,
                                                              .layerMaxXMaxYCorner])
        return view
    }()

    lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.backgroundColor = .white
        searchTextField.placeholder = "Search City"
        searchTextField.makeRoundedCorner(cornerRadius: 15, borderColor: .appFirod, borderWidth: 1)
        searchTextField.setPaddingPoints(20)
        return searchTextField
    }()

    lazy var tableView: IntrinsicTableView = {
        let tableView = IntrinsicTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.identifier)
        return tableView
    }()

    lazy var dismissBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.backgroundColor = .appZircon
        btn.setTitle("", for: .normal)
        btn.isHidden = true
        btn.makeRoundedCorner(cornerRadius: 30, cornerMask: [.layerMinXMaxYCorner,
                                                             .layerMaxXMaxYCorner])
        return btn
    }()

    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.backgroundColor = .appZircon
        btn.setTitle("", for: .normal)
        return btn
    }()

    lazy var clearTextFieldBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "X"), for: .normal)
        btn.backgroundColor = .appZircon
        btn.setTitle("", for: .normal)
        return btn
    }()

    override func setupView() {
        super.setupView()
        backgroundColor = .white.withAlphaComponent(0.0)
        addSubview(searchView)
        searchView.anchor(.leading(leadingAnchor),
                          .trailing(trailingAnchor),
                          .top(topAnchor),
                          .height(164))

        searchView.addSubview(searchTextField)
        searchTextField.anchor(.leading(searchView.leadingAnchor, constant: 60),
                               .trailing(searchView.trailingAnchor, constant: 30),
                               .height(50),
                               .top(searchView.topAnchor, constant: 60))

        searchView.addSubview(backBtn)
        backBtn.anchor(.leading(searchView.leadingAnchor, constant: 30),
                       .centerY(searchTextField.centerYAnchor))

        searchView.addSubview(clearTextFieldBtn)
        clearTextFieldBtn.anchor(.trailing(searchTextField.trailingAnchor, constant: 20),
                                 .centerY(searchTextField.centerYAnchor),
                                 .width(12),
                                 .height(12))

        addSubview(tableView)
        tableView.anchor(.leading(leadingAnchor),
                         .trailing(trailingAnchor),
                         .top(searchView.bottomAnchor))

        addSubview(dismissBtn)
        dismissBtn.anchor(.leading(leadingAnchor),
                          .trailing(trailingAnchor),
                          .top(tableView.bottomAnchor),
                          .height(38))
    }

    func setDelegates(_ delegate: Any) {
        tableView.delegate = delegate as? UITableViewDelegate
        tableView.dataSource = delegate as? UITableViewDataSource
        searchTextField.delegate = delegate as? UITextFieldDelegate
    }

}
