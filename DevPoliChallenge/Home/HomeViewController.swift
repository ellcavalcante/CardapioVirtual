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
    
    let sectionTitles = ["Entrada", "Carnes", "Peixe", "Massas", "Sobremesas", "Bebidas"]
    
    let menuDataEntradas = [CollectionModel(titleLabel: "Salada Caprese", subTitleLabel: "Tomate, muçarela de búfala, manjericão e azeite de oliva.", priceLabel: "25,90"),
                    CollectionModel(titleLabel: "Bruschetta", subTitleLabel: "Pão italiano com tomate, manjericão e azeite de oliva.", priceLabel: "19,90"),
                    CollectionModel(titleLabel: "Carpaccio", subTitleLabel: "Carne crua fatiada, regada com molho de mostarda e alcaparras.", priceLabel: "29,90")]
    
    let menuDataCarnes = [CollectionModel(titleLabel: "Bife à Parmegiana", subTitleLabel: "Bife empanado coberto com molho de tomate e queijo derretido, acompanhado de arroz e batata frita.", priceLabel: "45,90"),
                          CollectionModel(titleLabel: "Filé Mignon", subTitleLabel: "Filé mignon grelhado com molho de cogumelos, acompanhado de purê de batatas.", priceLabel: "55,90"),
                          CollectionModel(titleLabel: "Costela BBQ", subTitleLabel: "Costela suína assada com molho barbecue, acompanhada de batatas rústicas.", priceLabel: "39,90"),
                          CollectionModel(titleLabel: "Strogonoff", subTitleLabel: "Cubos de carne macia, creme de leite, champignons e temperos especiais.", priceLabel: "35,90"),
                          CollectionModel(titleLabel: "Bife a Cavalo", subTitleLabel: "Bife grelhado e ovo estrelado.", priceLabel: "29,90")]
    
    let menuDataPeixes = [CollectionModel(titleLabel: "Salmão Grelhado", subTitleLabel: "Salmão grelhado com legumes ao vapor.", priceLabel: "38,50"),
                          CollectionModel(titleLabel: "Moqueca de Peixe", subTitleLabel: "Peixe cozido em leite de coco, dendê, pimentões e coentro, acompanhado de arroz e pirão.", priceLabel: "42,90")]
    
    let menuDataMassas = [CollectionModel(titleLabel: "Nhoque ao Molho Pesto", subTitleLabel: "Nhoque de batata com molho pesto de manjericão.", priceLabel: "29,90"),
                          CollectionModel(titleLabel: "Lasanha à Bolonhesa", subTitleLabel: "Lasanha com camadas de massa intercaladas com molho bolonhesa, molho branco e queijo.", priceLabel: "35,90")]
    
    let menuDataSobremesas = [CollectionModel(titleLabel: "Tiramisu", subTitleLabel: "Sobremesa clássica italiana à base de café, creme de queijo mascarpone e cacau em pó.", priceLabel: "15"),
                              CollectionModel(titleLabel: "Pudim de Leite", subTitleLabel: "Pudim de leite condensado com calda de caramelo.", priceLabel: "11"),
                              CollectionModel(titleLabel: "Mousse de Chocolate", subTitleLabel: "Mousse de chocolate com chantilly.", priceLabel: "14,50")]
    
    let menuDataBebidas = [CollectionModel(titleLabel: "Água Mineral", subTitleLabel: "Água mineral com ou sem gás.", priceLabel: "5"),
                          CollectionModel(titleLabel: "Caipirinha", subTitleLabel: "Bebida refrescante feita com cachaça, limão, açúcar e gelo.", priceLabel: "12,50"),
                          CollectionModel(titleLabel: "Cerveja", subTitleLabel: "Cervejas diversas, como pilsen, lager e IPA.", priceLabel: "8,50"),
                          CollectionModel(titleLabel: "Mojito", subTitleLabel: "Bebida refrescante feita com rum, hortelã, limão, açúcar e água com gás.", priceLabel: "14,90"),
                          CollectionModel(titleLabel: "Refrigerante", subTitleLabel: "Refrigerante de cola ou guaraná.", priceLabel: "6")]
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
        screen?.configTextFieldDelegate(delegate: self)
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return menuDataEntradas.count
        } else if section == 1 {
            return menuDataCarnes.count
        } else if section == 2 {
            return menuDataPeixes.count
        } else if section == 3 {
            return menuDataMassas.count
        } else if section == 4 {
            return menuDataSobremesas.count
        } else if section == 5 {
            return menuDataBebidas.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        if indexPath.section == 0 {
            cell?.setupCell(data: menuDataEntradas[indexPath.row])
        } else if indexPath.section == 1 {
            cell?.setupCell(data: menuDataCarnes[indexPath.row])
        } else if indexPath.section == 2 {
            cell?.setupCell(data: menuDataPeixes[indexPath.row])
        } else if indexPath.section == 3 {
            cell?.setupCell(data: menuDataMassas[indexPath.row])
        } else if indexPath.section == 4 {
            cell?.setupCell(data: menuDataSobremesas[indexPath.row])
        } else if indexPath.section == 5 {
            cell?.setupCell(data: menuDataBebidas[indexPath.row])
        }
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        let label = UILabel()
        label.text = sectionTitles[section]
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
