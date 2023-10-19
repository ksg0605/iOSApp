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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: - Configure UI
    private func setupUI() {
        self.view.addSubview(exampleTextfield)
        self.exampleTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
    }

}

