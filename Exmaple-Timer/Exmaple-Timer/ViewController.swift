//
//  ViewController.swift
//  Exmaple-Timer
//
//  Created by 김선규 on 10/15/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - UIComponents
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "타이머"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let topLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "초를 선택하세요"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    private let minTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "0초"
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let maxTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "60초"
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("RESET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let timeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 60.0
        slider.thumbTintColor = .white
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .lightGray
        return slider
    }()
    
    private let bottomLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.0
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var sliderStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        return sv
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
           
        ])
        
        self.topLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topLineView.heightAnchor.constraint(equalToConstant: 1.0),
           
        ])
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.timeLabel.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
        self.minTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.minTimeLabel.widthAnchor.constraint(equalToConstant: 45),
        ])
        
        self.timeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.maxTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.maxTimeLabel.widthAnchor.constraint(equalToConstant: 45),
        ])
        
        self.bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.bottomLineView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
        
        self.resetButton.translatesAutoresizingMaskIntoConstraints = false
        self.startButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.sliderStackView)
        self.sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        [minTimeLabel, timeSlider, maxTimeLabel].map {
            self.sliderStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.sliderStackView.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        self.view.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [titleLabel, topLineView, timeLabel, sliderStackView, bottomLineView].map {
            self.stackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 130),
            self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        self.view.addSubview(buttonStackView)
        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        [resetButton, startButton].map{
            buttonStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            self.buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.buttonStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            self.buttonStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

