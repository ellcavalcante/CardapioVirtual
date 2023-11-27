//
//  HomeTableViewScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeTableViewScreen: UIView {
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filé Mignon"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    public lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filé mignon grelhado com molho de cogumelos, acompanhado de purê de batatas."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "55,90"
        label.textColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(priceLabel)
        backgroundColor()
        configConstraints()
    }
    
    private func backgroundColor() {
        backgroundColor = .white
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
           
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 250),
            
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
}
