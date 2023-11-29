//
//  SearchViewController.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 28/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var screen: SearchScreen?
    
    override func loadView() {
        screen = SearchScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}

extension SearchViewController: UITextFieldDelegate {
    
}

extension SearchViewController: SearchScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
