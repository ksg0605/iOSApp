//
//  ViewController.swift
//  Stopwatch
//
//  Created by 김선규 on 10/11/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    
    // MARK: - Variables
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Stopwatch"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
        
    }
    
    // MARK: - configure UI
    private func setupUI() {
        self.view.addSubview(mainTitle)
        self.mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.mainTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 15),
            self.mainTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }

   
}

struct VCPreView:PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
