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
    var dataArray: TableRow
    var restOfData: [TableRow]
    var filteredRestOfData: [TableRow] = []
    
    init(category: String, dataArray: TableRow, restOfData: [TableRow]) {
        
        self.categoryLabel = category
        self.dataArray = dataArray
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
        screen?.titleLabel.text = dataArray.title
        screen?.descriptionTextLabel.text = dataArray.description
        screen?.backgroundTitleLabel.text = categoryLabel
        screen?.priceLabel.text = "R$ \(dataArray.price)"
        
        for row in restOfData {
            if row.title != screen?.titleLabel.text {
                filteredRestOfData.append(row)
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
        return restOfData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DetailsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell
        cell?.setupCell(data: restOfData[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = restOfData[indexPath.row]
        
        guard let selectedCategory = selectedData.category else {
            return
        }
        
        let passRestOfData = MenuSingleton.shared.sections
            .flatMap { $0.rows }
            .filter { row in
                if let category = row.category {
                    return category == selectedCategory
                }
                return false
            }
        
        let vc: DetailsViewController = DetailsViewController(
            category: categoryLabel,
            dataArray: selectedData,
            restOfData: passRestOfData
        )
        navigationController?.pushViewController(vc, animated: true)
    }
}
