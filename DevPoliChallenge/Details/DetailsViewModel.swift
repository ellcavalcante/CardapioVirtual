//
//  DetailsViewModel.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 18/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class DetailsViewModel {
    
    func numberOfItemsInSection(forCategory category: String, restOfData: [TableRow]) -> Int {
        return restOfData.count
    }
    
    func sizeForItemAt(indexPath: IndexPath) -> CGSize {
        return CGSize(width: 253, height: 85)
    }
}
