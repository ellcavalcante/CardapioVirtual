//
//  HomeTableViewCell.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: HomeTableViewCell.self)
    var homeTableViewScreen: HomeTableViewScreen = HomeTableViewScreen()
    
    func setupCell(data: CollectionModel) {
        homeTableViewScreen.titleLabel.text = data.titleLabel
        homeTableViewScreen.subTitleLabel.text = data.subTitleLabel
        homeTableViewScreen.priceLabel.text = data.priceLabel
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        homeTableViewScreen.layer.cornerRadius = 10
        homeTableViewScreen.layer.borderWidth = 4.0
        homeTableViewScreen.layer.borderColor = UIColor.white.cgColor
        homeTableViewScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(homeTableViewScreen)
        backgroungColor()
        configConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            homeTableViewScreen.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            homeTableViewScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableViewScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableViewScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
