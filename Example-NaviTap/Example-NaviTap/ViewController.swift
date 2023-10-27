//
//  ViewController.swift
//  Example-NaviTap
//
//  Created by 김선규 on 10/27/23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - UI Componenets
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        
        self.view.addSubview(loginButton)
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.loginButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.loginButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 45),
            self.loginButton.widthAnchor.constraint(equalToConstant: 120),
        ])
        
    }
    
    // MARK: - Button Methods
    @objc private func tappedLoginButton() {
        let firstVC = FirstViewController()
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true)
    }


}

