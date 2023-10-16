//
//  ViewController.swift
//  UIKit-Calculator
//
//  Created by 김선규 on 10/14/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    // MARK: - UI Components
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.text = "0"
        label.font = .systemFont(ofSize: 100)
        return label
    }()
    
    private let allClearButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("AC", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    private let plusMinusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("+/-", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    private let percentButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("%", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    private let divideButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("÷", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        return btn
    }()
    
    private let sevenButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("7", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let eightButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("8", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let nineButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("9", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let multiplyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("X", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        return btn
    }()
    
    private let fourButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("4", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let fiveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("5", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let sixButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("6", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let subtractButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        return btn
    }()
    
    private let oneButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("1", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let twoButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("2", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let threeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("3", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let addButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        return btn
    }()
    
    private let zeroButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("0", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let dotButton: UIButton = {
        let btn = UIButton()
        btn.setTitle(".", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        return btn
    }()
    
    private let equalButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("=", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 40)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        return btn
    }()
    
    private lazy var firstStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var secondStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var thirdStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var fourthStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var fifthStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 20
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundButton()
    }
    
    
    // MARK: - Configure UI
    private func setupUI() {
        self.view.addSubview(resultLabel)
        self.resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.resultLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.resultLabel.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        self.view.addSubview(firstStackView)
        [allClearButton, plusMinusButton, percentButton, divideButton].map{
            firstStackView.addArrangedSubview($0)
        }
        
        self.view.addSubview(secondStackView)
        [sevenButton, eightButton, nineButton, multiplyButton].map{
            secondStackView.addArrangedSubview($0)
        }
       
        self.view.addSubview(thirdStackView)
        [fourButton, fiveButton, sixButton, subtractButton].map{
            thirdStackView.addArrangedSubview($0)
        }
        
        self.view.addSubview(fourthStackView)
        [oneButton, twoButton, threeButton, addButton].map{
            fourthStackView.addArrangedSubview($0)
        }
        
        
        self.view.addSubview(fifthStackView)
        [zeroButton, dotButton, equalButton].map{
            fifthStackView.addArrangedSubview($0)
        }
        
        self.view.addSubview(buttonStackView)
        [firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView].map{
            buttonStackView.addArrangedSubview($0)
        }
        self.buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.buttonStackView.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: -10),
            self.buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.buttonStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
    }
    
    private func roundButton() {
        [
            allClearButton, plusMinusButton, percentButton, divideButton,
            sevenButton, eightButton, nineButton, multiplyButton,
            fourButton, fiveButton, sixButton, subtractButton,
            oneButton, twoButton, threeButton, addButton,
            dotButton, equalButton
        ].map {
            $0.layer.cornerRadius = $0.layer.cornerRadius / 2
            $0.layer.masksToBounds = true
            $0.layer.borderWidth = 1.0 // 원하는 두께로 조절
            $0.layer.borderColor = UIColor.clear.cgColor // 테두리 색상 (여기서는 투명하게 설정)
        }
    }
    
    
}


// MARK: - UI Preview
struct PreView: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}


#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
