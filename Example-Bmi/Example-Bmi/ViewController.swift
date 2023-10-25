//
//  ViewController.swift
//  Example-Bmi
//
//  Created by 김선규 on 10/23/23.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Variables
    var bmiManager = BMICalculatorManager()
    var bmi: BMI?
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해 주세요"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let heightTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 18)
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .white
        tf.placeholder = "cm 단위로 입력해주세요"
        return tf
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let weightTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.font = .systemFont(ofSize: 18)
        tf.layer.cornerRadius = 5
        tf.backgroundColor = .white
        tf.placeholder = "kg 단위로 입력해주세요"
        return tf
    }()
    
    private lazy var calculateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var heightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        [heightLabel, heightTextField].forEach {
            sv.addArrangedSubview($0)
        }
        
        return sv
    }()
    
    private lazy var weightStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        [weightLabel, weightTextField].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    private lazy var totalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 20
        [titleLabel, heightStackView, weightStackView].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        
        setupUI()
    }
    
    
    // MARK: - TappedCalculateButton
    @objc private func tappedCalculateButton() {
        
        if self.heightTextField.text == "" || self.weightTextField.text == "" {
            titleLabel.text = "수치를 입력해주세요"
            titleLabel.textColor = .red
        } else {
            let nextVC = SecondViewController()
            self.bmi = bmiManager.calculateBMI(height: self.heightTextField.text!, weight: self.weightTextField.text!)
            nextVC.bmi = self.bmi
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
        }
        
        
        
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        self.view.addSubview(totalStackView)
        self.view.addSubview(calculateButton)
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.heightLabel.translatesAutoresizingMaskIntoConstraints = false
        self.weightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.totalStackView.translatesAutoresizingMaskIntoConstraints = false
        self.heightStackView.translatesAutoresizingMaskIntoConstraints = false
        self.weightStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.totalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 130),
            self.totalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.totalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.totalStackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            self.titleLabel.heightAnchor.constraint(equalToConstant: 35),
            self.heightStackView.heightAnchor.constraint(equalToConstant: 35),
            self.weightStackView.heightAnchor.constraint(equalToConstant: 35),
            
            self.heightLabel.widthAnchor.constraint(equalToConstant: 60),
            self.weightLabel.widthAnchor.constraint(equalToConstant: 60),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 45),
        ])

        
       
    }


}


// MARK: - Extension UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
            
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}

