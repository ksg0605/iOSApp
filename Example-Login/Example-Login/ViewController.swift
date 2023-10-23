//
//  ViewController.swift
//  Example-Login
//
//  Created by 김선규 on 10/22/23.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - UI Components
    private let emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    private let passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    private let passwordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("표시", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    private let passwordResetButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 18
        return sv
    }()
    
    private lazy var emailInfoLabelCenterYConstraint = self.loginLabel.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor)
    private lazy var passwordInfoLabelCenterYConstraint = self.passwordLabel.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor)
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        setupUI()
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        self.view.addSubview(loginStackView)
        self.loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        [emailView, passwordView, loginButton].map{
            self.loginStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.loginStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.loginStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.loginStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            self.loginStackView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        self.view.addSubview(loginLabel)
        self.loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.loginLabel.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor),
            self.loginLabel.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor, constant: 8),
            self.loginLabel.trailingAnchor.constraint(equalTo: self.emailView.trailingAnchor, constant: -8),
        ])
        
        self.view.addSubview(emailTextField)
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 15),
            self.emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -2),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.emailView.leadingAnchor, constant: 8),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.emailView.trailingAnchor, constant: -8),
        ])
        
        self.view.addSubview(passwordLabel)
        self.passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.passwordLabel.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor, constant: 8),
            self.passwordLabel.trailingAnchor.constraint(equalTo: self.passwordView.trailingAnchor, constant: -8),
        ])
        
        self.view.addSubview(passwordTextField)
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 15),
            self.passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -2),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.passwordView.leadingAnchor, constant: 8),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.passwordView.trailingAnchor, constant: -8),
        ])
        
        self.view.addSubview(passwordButton)
        self.passwordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.passwordButton.centerYAnchor.constraint(equalTo: self.passwordLabel.centerYAnchor),
            self.passwordButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
        ])
        
        self.view.addSubview(passwordResetButton)
        self.passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.passwordResetButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 10),
            self.passwordResetButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.passwordResetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            self.passwordResetButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }


}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField === emailTextField {
            self.emailTextField.backgroundColor = .gray
            self.loginLabel.font = .systemFont(ofSize: 11)
            self.emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField === passwordTextField {
            self.passwordTextField.backgroundColor = .gray
            self.passwordLabel.font = .systemFont(ofSize: 11)
            self.passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        UIView.animate(withDuration: 0.3) {
            self.loginStackView.layoutIfNeeded()
            self.emailTextField.layoutIfNeeded()
            self.loginLabel.layoutIfNeeded()
            self.passwordTextField.layoutIfNeeded()
            self.passwordLabel.layoutIfNeeded()
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if textField == emailTextField {
                emailView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                if emailTextField.text == "" {
                    loginLabel.font = UIFont.systemFont(ofSize: 18)
                    self.loginLabel.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor).constant = 0
                }
            }
            if textField == passwordTextField {
                passwordView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
                if passwordTextField.text == "" {
                    passwordLabel.font = UIFont.systemFont(ofSize: 18)
                    self.passwordLabel.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor).constant = 0
                }
            }
        }
    }
}
