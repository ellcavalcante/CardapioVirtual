//
//  DetailsScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol DetailsScreenProtocol {
    func actionBackButton()

}

class DetailsScreen: UIView {
    
    var delegate: DetailsScreenProtocol?
    
    private lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "icon_back"), for: .normal)
        bButton.imageView?.contentMode = .scaleToFill
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bife à Parmegiana"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    public lazy var backgroundLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1.0)
        return label
    }()
    
    public lazy var backgroundTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carnes"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    public lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bife empanado coberto com molho de tomate e queijo derretido, acompanhado de arroz e batata frita."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    public lazy var othersItensLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Outros itens de carnes"
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var destaquesCollection: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.delaysContentTouches = false
        collection.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collection.setCollectionViewLayout(layout, animated: false)
        collection.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        return collection
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 63/255, green: 75/255, blue: 107/255, alpha: 1.0)
        return view
    }()
    
    public lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 45,90"
        label.textColor = UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    func configProtocolsDestaquesCollection(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        destaquesCollection.delegate = delegate
        destaquesCollection.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(backgroundLabel)
        backgroundLabel.addSubview(backgroundTitleLabel)
        addSubview(descriptionTextLabel)
        addSubview(othersItensLabel)
        addSubview(destaquesCollection)
        addSubview(bottomView)
        bottomView.addSubview(valueLabel)
        bottomView.addSubview(priceLabel)
        backgroungColor()
        setUpConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            
            backgroundLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            backgroundLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            backgroundLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            backgroundLabel.heightAnchor.constraint(equalToConstant: 40),
            
            backgroundTitleLabel.centerYAnchor.constraint(equalTo: backgroundLabel.centerYAnchor),
            backgroundTitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 26),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: backgroundTitleLabel.bottomAnchor, constant: 25),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            othersItensLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            othersItensLabel.bottomAnchor.constraint(equalTo: destaquesCollection.topAnchor, constant: -8),
            
            destaquesCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            destaquesCollection.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            destaquesCollection.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -23),
            destaquesCollection.heightAnchor.constraint(equalToConstant: 85),

            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 110),
            
            valueLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
            valueLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
            priceLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
        ])
    }
}
