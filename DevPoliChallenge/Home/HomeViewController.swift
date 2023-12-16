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
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
        tap()
    }
    
    private func tap() {
        
        let whatsGTBTView = UITapGestureRecognizer(target: self, action: #selector(whatsViewTapped))
        screen?.whatsGoingToBeTodayView.addGestureRecognizer(whatsGTBTView)
    }
    
    @objc func whatsViewTapped() {
        let searchScreen: SearchViewController = SearchViewController()
        self.navigationController?.pushViewController(searchScreen, animated: true)
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func actionEntryButton() {
        let indexPath = IndexPath(row: 0, section: 0)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func actionMeatButton() {
        let indexPath = IndexPath(row: 0, section: 1)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func actionFishButton() {
        let indexPath = IndexPath(row: 0, section: 2)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func actionPastaButton() {
        let indexPath = IndexPath(row: 0, section: 3)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func actionDessertButton() {
        let indexPath = IndexPath(row: 0, section: 4)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func actionDrinksButton() {
        let indexPath = IndexPath(row: 0, section: 5)
        screen?.homeTableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    //Número de seção
    func numberOfSections(in tableView: UITableView) -> Int {
        MenuSingleton.shared.sections.count
    }
    
    //Número de linhas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MenuSingleton.shared.sections[section].rows.count
    }
    
    //Construção da cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupCell(data: MenuSingleton.shared.sections[indexPath.section].rows[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        let label = UILabel()
        label.text = MenuSingleton.shared.sections[section].title
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: headerView.topAnchor),
        ])
        
        return headerView
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        MenuSingleton.shared.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = MenuSingleton.shared.sections[indexPath.section]
        let restOfData = MenuSingleton.shared.sections[indexPath.section].rows
        let selectedRow = MenuSingleton.shared.sections[indexPath.section].rows[indexPath.row]
        
        let vc: DetailsViewController = DetailsViewController(category: section.title ?? "", dataArray: selectedRow, restOfData: restOfData)
        navigationController?.pushViewController(vc, animated: true)
    }
}

