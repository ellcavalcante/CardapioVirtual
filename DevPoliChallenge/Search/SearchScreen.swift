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
        return textField
    }()
    
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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
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

        ])
    }
}
