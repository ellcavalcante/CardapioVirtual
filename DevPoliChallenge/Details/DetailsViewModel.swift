//
//  DetailsViewModel.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 18/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsViewModel {
    
    var categoryLabel: String = ""

    func numberOfItemsInSection(forCategory category: String, restOfData: [TableRow]) -> Int {
        return restOfData.count
    }
    
    func sizeForItemAt(indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 85)
    }
    
    func didSelectItemAt(indexPath: IndexPath, restOfData: [TableRow]) -> DetailsViewController? {
        guard indexPath.row >= 0, indexPath.row < restOfData.count else {
            return nil
        }
        
        let selectedData = restOfData[indexPath.row]
        
        guard let selectedCategory = selectedData.category else {
            return nil
        }
        
        let passRestOfData = MenuSingleton.shared.sections
            .flatMap { $0.rows }
            .filter { row in
                if let category = row.category {
                    return category == selectedCategory
                }
                return false
            }
        
        return DetailsViewController(
            category: categoryLabel,
            dataArray: selectedData,
            restOfData: passRestOfData
        )
    }
}
