//
//  TableSection.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 06/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

struct TableSection {
    
    let title: String?
    let rows: [TableRow]
}

struct TableRow {
    let title: String
    let description: String
    let price: String
    let category: [Category]?
}

struct Category {
    let id: Int
    let category: String
}
