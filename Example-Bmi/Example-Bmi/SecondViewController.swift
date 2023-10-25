//
//  SecondViewController.swift
//  Example-Bmi
//
//  Created by 김선규 on 10/24/23.
//

import UIKit

class SecondViewController: UIViewController {

    var bmi: BMI?
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI 결과값"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.text = "\(bmi!.value)"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.backgroundColor = bmi!.matchColor
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = bmi?.advice
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다시 계산하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var bmiStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        
        [titleLabel, bmiLabel, resultLabel].forEach {
            sv.addArrangedSubview($0)
        }
        
        return sv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        self.setupUI()
    }
    
    
    // MARK: - Methods
    @objc private func tappedBackButton() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        
        self.view.addSubview(self.bmiStackView)
        self.view.addSubview(self.backButton)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        self.resultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.bmiStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalToConstant: 40),
            self.bmiLabel.heightAnchor.constraint(equalToConstant: 50),
            self.resultLabel.heightAnchor.constraint(equalToConstant: 40),
            
            self.bmiStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 130),
            self.bmiStackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.bmiStackView.widthAnchor.constraint(equalToConstant: 200),
            
            
            self.backButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            self.backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.backButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.backButton.heightAnchor.constraint(equalToConstant: 45),
            
            
        ])
    }

}
