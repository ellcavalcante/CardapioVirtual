//
//  DetailsCollectionViewCell.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: DetailsCollectionViewCell.self)
    let customDetailsCollectionScreen: DetailsCollectionViewScreen = DetailsCollectionViewScreen()
    
    
    func setupCell(data: CollectionModel) {
        customDetailsCollectionScreen.titleLabel.text = data.titleLabel
        customDetailsCollectionScreen.subTitleLabel.text = data.subTitleLabel
        customDetailsCollectionScreen.priceLabel.text = data.priceLabel
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        customDetailsCollectionScreen.layer.cornerRadius = 10
        customDetailsCollectionScreen.layer.borderWidth = 4.0
        customDetailsCollectionScreen.layer.borderColor = UIColor.white.cgColor
        customDetailsCollectionScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customDetailsCollectionScreen)
        setUpConstraints()
        backgroungColor()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            customDetailsCollectionScreen.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            customDetailsCollectionScreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            customDetailsCollectionScreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            customDetailsCollectionScreen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
