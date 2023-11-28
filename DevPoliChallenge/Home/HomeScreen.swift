//
//  HomeScreen.swift
//  DevPoliChallenge
//
//  Created by Ellington Cavalcante on 25/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol HomeScreenProtocol {
    func actionEntryButton()
    func actionMeatButton()
    func actionFishButton()
    func actionPastaButton()
    func actionDessertButton()
    func actionDrinksButton()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    private lazy var imageV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(red: 149/255, green: 149/255, blue: 149/255, alpha: 1.0)
        return imageView
    }()
    
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
        return textField
    }()
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        whatsGoingToBeToday.delegate = delegate
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackViewButtons: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    public lazy var entryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrada", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedentryButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedentryButton(){
        delegate?.actionEntryButton()
    }
    
    public lazy var meatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Carnes", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedMeatButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMeatButton(){
        delegate?.actionMeatButton()
    }

    public lazy var fishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Peixe", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedFishButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedFishButton(){
        delegate?.actionFishButton()
    }
    
    public lazy var pastaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Massas", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedPastaButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedPastaButton(){
        delegate?.actionPastaButton()
    }
    
    public lazy var dessertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sobremesas", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedDessertButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedDessertButton(){
        delegate?.actionDessertButton()
    }
    
    public lazy var drinksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bebidas", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(red: 96/255, green: 108/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 10.0
        button.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedDrinksButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedDrinksButton(){
        delegate?.actionDrinksButton()
    }
    
    lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
        
    }()
    
    private func configureStackView() {
        stackViewButtons.addArrangedSubview(entryButton)
        stackViewButtons.addArrangedSubview(meatButton)
        stackViewButtons.addArrangedSubview(fishButton)
        stackViewButtons.addArrangedSubview(pastaButton)
        stackViewButtons.addArrangedSubview(dessertButton)
        stackViewButtons.addArrangedSubview(drinksButton)
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        homeTableView.delegate = delegate
        homeTableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(whatsGoingToBeToday)
        whatsGoingToBeToday.addSubview(imageV)
        addSubview(scrollView)
        scrollView.addSubview(stackViewButtons)
        addSubview(homeTableView)
        configureStackView()
        backgroungColor()
        setUpConstraints()
    }
    
    private func backgroungColor() {
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 243/255, alpha: 1.0)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            whatsGoingToBeToday.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            whatsGoingToBeToday.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            whatsGoingToBeToday.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            whatsGoingToBeToday.heightAnchor.constraint(equalToConstant: 46),
        
            imageV.trailingAnchor.constraint(equalTo: whatsGoingToBeToday.trailingAnchor, constant: -12),
            imageV.centerYAnchor.constraint(equalTo: whatsGoingToBeToday.centerYAnchor),
            imageV.heightAnchor.constraint(equalToConstant: 24),
            imageV.widthAnchor.constraint(equalToConstant: 24),
            
            scrollView.topAnchor.constraint(equalTo: whatsGoingToBeToday.bottomAnchor, constant: 13),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollView.heightAnchor.constraint(equalToConstant: 35),
            
            stackViewButtons.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackViewButtons.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackViewButtons.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackViewButtons.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            dessertButton.widthAnchor.constraint(equalToConstant: 100),
            
            homeTableView.topAnchor.constraint(equalTo: stackViewButtons.bottomAnchor, constant: 10),
            homeTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            homeTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            homeTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            

        ])
    }
}

