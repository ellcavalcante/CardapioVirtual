//
//  SearchScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 28/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol SearchScreenProtocol {
    func actionBackButton()
    func actionWhatsGoingToBeToday(_ text: String)
}

class SearchScreen: UIView {
    
    var delegate: SearchScreenProtocol?
    
    private lazy var backButton: UIButton = {
        let bButton = UIButton()
        bButton.translatesAutoresizingMaskIntoConstraints = false
        bButton.setImage(UIImage(named: "icon_back"), for: .normal)
        bButton.imageView?.contentMode = .scaleToFill
        bButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return bButton
    }()
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    public lazy var whatsGoingToBeToday: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 7.5
        textField.layer.borderColor = UIColor(displayP3Red: 233/255, green: 241/255, blue: 247/255, alpha: 1.0).cgColor
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        let placeholderText = "O que vai ser hoje?"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16.0),
            .foregroundColor: UIColor.systemGray
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.attributedPlaceholder = attributedPlaceholder
        textField.textColor = UIColor(red: 149/255, green: 149/255, blue: 149/255, alpha: 1.0)
        textField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        textField.addTarget(self, action: #selector(configTextField), for: .editingChanged)
        return textField
    }()
    
    @objc func configTextField() {
        delegate?.actionWhatsGoingToBeToday(whatsGoingToBeToday.text ?? "")
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        whatsGoingToBeToday.delegate = delegate
    }
    
    private lazy var imageV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "icon_search")
        imageView.tintColor = UIColor(red: 149/255, green: 149/255, blue: 149/255, alpha: 1.0)
        return imageView
    }()
    
    public lazy var titleTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Resultado da busca"
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    public lazy var noResultsTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nenhum resultado\n encontrado para "
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.isHidden = true
        return label
    }()
    
    public lazy var typeSomethingTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite algo para \nrealizar a pesquisa =)"
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    public lazy var sugestionsTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Veja nossa sugestão"
        label.textColor = UIColor(red: 63/255, green: 76/255, blue: 107/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.isHidden = true
        return label
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
        
    }()
    
    func configSearchTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        searchTableView.delegate = delegate
        searchTableView.dataSource = dataSource
    }
    
    lazy var randomTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isHidden = true
        tableView.backgroundColor = .red
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
        
    }()
    
    func configRandomTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        randomTableView.delegate = delegate
        randomTableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(backButton)
        addSubview(whatsGoingToBeToday)
        whatsGoingToBeToday.addSubview(imageV)
        addSubview(titleTextLabel)
        addSubview(searchTableView)
        addSubview(randomTableView)
        addSubview(noResultsTextLabel)
        addSubview(sugestionsTextLabel)
        addSubview(typeSomethingTextLabel)
        backgroungColor()
        setUpConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            whatsGoingToBeToday.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 16),
            whatsGoingToBeToday.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            whatsGoingToBeToday.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            whatsGoingToBeToday.heightAnchor.constraint(equalToConstant: 46),
            
            imageV.trailingAnchor.constraint(equalTo: whatsGoingToBeToday.trailingAnchor, constant: -14),
            imageV.centerYAnchor.constraint(equalTo: whatsGoingToBeToday.centerYAnchor),
            imageV.heightAnchor.constraint(equalToConstant: 24),
            imageV.widthAnchor.constraint(equalToConstant: 24),
            
            titleTextLabel.topAnchor.constraint(equalTo: whatsGoingToBeToday.bottomAnchor, constant: 20),
            titleTextLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            searchTableView.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 10),
            searchTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            noResultsTextLabel.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 50),
            noResultsTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sugestionsTextLabel.topAnchor.constraint(equalTo: noResultsTextLabel.bottomAnchor, constant: 50),
            sugestionsTextLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            randomTableView.topAnchor.constraint(equalTo: sugestionsTextLabel.bottomAnchor, constant: 10),
            randomTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            randomTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            randomTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            typeSomethingTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            typeSomethingTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
