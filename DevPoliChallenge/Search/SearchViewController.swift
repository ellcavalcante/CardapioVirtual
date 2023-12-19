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
    var orderedSections: [TableSection] = []
    var data: [TableRow] = []
    
    override func loadView() {
        screen = SearchScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configTextFieldDelegate(delegate: self)
        screen?.configSearchTableViewProtocols(delegate: self, dataSource: self)
        screen?.configRandomTableViewProtocols(delegate: self, dataSource: self)
        
        orderedSections = MenuSingleton.shared.sections.filter { section in
            switch section.title {
                
            case "Entradas": return true
            case "Carnes": return true
            case "Peixes": return true
            case "Massas": return true
            case "Sobremesas": return true
            case "Bebidas": return true
            default: return false
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension SearchViewController:  UITableViewDelegate, UITableViewDataSource {
    
    var shuffledSections: [TableSection] {
        return MenuSingleton.shared.sections.shuffled()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == screen?.searchTableView {
            return data.count
        } else if tableView == screen?.randomTableView {
            return orderedSections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == screen?.searchTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setupCell(data: data[indexPath.row])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        } else if tableView == screen?.randomTableView {
            let randomRows = orderedSections.compactMap { section -> TableRow? in
                let shuffledRows = section.rows.shuffled()
                return shuffledRows.first
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setupCell(data: randomRows[indexPath.row])
            cell?.selectionStyle = .none
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension SearchViewController: SearchScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionWhatsGoingToBeToday(_ text: String) {
        if text.isEmpty {
            data = []
            screen?.typeSomethingTextLabel.isHidden = false
        } else {
            let lowercasedText = text.lowercased()
            
            let filteredSingleArray = MenuSingleton.shared.sections.flatMap { data in
                return data.rows.filter { row in
                    let titleContainsText = row.title.lowercased().contains(lowercasedText)
                    let categoryContainsText = row.category?.first?.category.lowercased().contains(lowercasedText) ?? false
                    return titleContainsText || categoryContainsText
                }
            }
            
            if filteredSingleArray.isEmpty {
                let searchText = screen?.whatsGoingToBeToday.text ?? ""
                let boldText = "Nenhum resultado\n encontrado para "
                
                let attributedString = NSMutableAttributedString(string: boldText + searchText)
                
                let boldFont = UIFont.boldSystemFont(ofSize: 18)
                attributedString.addAttribute(NSAttributedString.Key.font, value: boldFont, range: NSRange(location: boldText.count, length: searchText.count))
                
                screen?.noResultsTextLabel.attributedText = attributedString
                screen?.noResultsTextLabel.isHidden = false
                screen?.sugestionsTextLabel.isHidden = false
                screen?.randomTableView.isHidden = false
                screen?.typeSomethingTextLabel.isHidden = true
            } else {
                screen?.noResultsTextLabel.isHidden = true
                screen?.sugestionsTextLabel.isHidden = true
                screen?.randomTableView.isHidden = true
                screen?.typeSomethingTextLabel.isHidden = true
            }
            data = filteredSingleArray
        }
        screen?.searchTableView.reloadData()
    }
}

