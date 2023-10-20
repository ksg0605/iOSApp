//
//  ViewController.swift
//  Example-DelegatePattern
//
//  Created by 김선규 on 10/18/23.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - UI Components
    private let exampleTextfield: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private let exampleButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Done", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    
    // MARK: - Configure UI
    private func setupUI() {
        
        self.exampleTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        self.exampleButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [exampleTextfield, exampleButton].map{
            self.stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 180),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 30),
            self.stackView.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

}

