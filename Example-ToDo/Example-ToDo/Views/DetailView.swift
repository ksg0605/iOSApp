//
//  DetailView.swift
//  Example-ToDo
//
//  Created by 김선규 on 12/11/23.
//

import UIKit

final class DetailView: UIView {

    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Red", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.backgroundColor = MyColor.red.backgroundColor
        button.setTitleColor(MyColor.red.buttonColor, for: .normal)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Green", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 2
        button.backgroundColor = MyColor.green.backgroundColor
        button.setTitleColor(MyColor.green.buttonColor, for: .normal)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Blue", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 3
        button.backgroundColor = MyColor.blue.backgroundColor
        button.setTitleColor(MyColor.blue.buttonColor, for: .normal)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Purple", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 4
        button.backgroundColor = MyColor.purple.backgroundColor
        button.setTitleColor(MyColor.purple.buttonColor, for: .normal)
        return button
    }()
    
    lazy var buttons: [UIButton] = [redButton, greenButton, blueButton, purpleButton]
    
    lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: buttons)
        stview.spacing = 15
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.isSelectable = true
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("SAVE", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 35),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        self.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            backgroundView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40)
        ])
        
        self.backgroundView.addSubview(mainTextView)
        
        NSLayoutConstraint.activate([
            mainTextView.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor, constant: 15),
            mainTextView.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -15),
            mainTextView.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 8),
            mainTextView.bottomAnchor.constraint(equalTo: self.backgroundView.bottomAnchor, constant: -8)
        ])
        
        self.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            saveButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 40)
        ])
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = stackView.bounds.height / 2
        }
    }
}
