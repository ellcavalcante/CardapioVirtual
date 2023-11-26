//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configTextFieldDelegate(delegate: self)
    }


}

extension HomeViewController: UITextFieldDelegate {
    
}

extension HomeViewController: HomeScreenProtocol {
    func actionMeatButton() {
        print(#function)
    }
    
    func actionFishButton() {
        print(#function)
    }
    
    func actionPastaButton() {
        print(#function)
    }
    
    func actionEntryButton() {
        print(#function)
    }
    
    
}

