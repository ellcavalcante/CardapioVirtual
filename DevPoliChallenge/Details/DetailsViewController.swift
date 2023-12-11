//
//  DetailsViewController.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var screen: DetailsScreen?
    
    var data: [CollectionModel] = [CollectionModel(titleLabel: "Filé Mignon", subTitleLabel: "Filé mignon grelhado com molho de cogumelos, acompanhado de purê de batatas.", priceLabel: "55,90"),
                                   CollectionModel(titleLabel: "Costela BBQ", subTitleLabel: "Costela suína assada com molho barbecue, acompanhada de batatas rústicas.", priceLabel: "39,90")]
    var categoryLabel: String
    var titleLabel: String
    var descriptionLabel: String
    var priceLabel: String
    var rowsInt: Int
    var restOfData: [TableRow]
    var filteredRestOfData: [TableRow] = []
    
    init(category: String, title: String, description: String, price: String, rows: Int, restOfData: [TableRow]) {
        
        self.categoryLabel = category
        self.titleLabel = title
        self.descriptionLabel = description
        self.priceLabel = price
        self.rowsInt = rows
        self.restOfData = restOfData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configProtocolsDestaquesCollection(delegate: self, dataSource: self)
        screen?.titleLabel.text = titleLabel
        screen?.descriptionTextLabel.text = descriptionLabel
        screen?.backgroundTitleLabel.text = categoryLabel
        screen?.priceLabel.text = "R$ \(priceLabel)"
        
        for item in restOfData {
            if item.title != titleLabel || item.description != descriptionLabel || item.price != priceLabel {
                filteredRestOfData.append(item)
            }
        }
        restOfData = filteredRestOfData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}

extension DetailsViewController: DetailsScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsInt - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DetailsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell
        cell?.setupCell(data: restOfData[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 85)
    }
}
