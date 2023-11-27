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
    
    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configProtocolsDestaquesCollection(delegate: self, dataSource: self)
        
    }
}

extension DetailsViewController: DetailsScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DetailsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as? DetailsCollectionViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 85)
    }
}
