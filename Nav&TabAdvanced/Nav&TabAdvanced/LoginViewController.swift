//
//  LoginViewController.swift
//  Nav&TabAdvanced
//
//  Created by 김선규 on 2023/09/06.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        
    }
    
    func makeUI() {
        view.backgroundColor = .green
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func loginButtonTapped() {
        dismiss(animated: true)
    }
    

    
}
