//
//  HomeViewModel.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 18/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    public func numberOfSections() -> Int {
        MenuSingleton.shared.sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard section >= 0, section < MenuSingleton.shared.sections.count else {
            return 0
        }
        return MenuSingleton.shared.sections[section].rows.count
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func titleForHeaderInSection(section: Int) -> String? {
        guard section >= 0, section < MenuSingleton.shared.sections.count else {
            return nil
        }
        return MenuSingleton.shared.sections[section].title
    }
    
    func didSelectRow(at indexPath: IndexPath) -> DetailsViewController? {
        guard indexPath.section >= 0, indexPath.section < MenuSingleton.shared.sections.count,
              indexPath.row >= 0, indexPath.row < MenuSingleton.shared.sections[indexPath.section].rows.count else {
            return nil 
        }
        
        let section = MenuSingleton.shared.sections[indexPath.section]
        let restOfData = MenuSingleton.shared.sections[indexPath.section].rows
        let selectedRow = MenuSingleton.shared.sections[indexPath.section].rows[indexPath.row]
        
        return DetailsViewController(category: section.title ?? "", dataArray: selectedRow, restOfData: restOfData)
    }
}
