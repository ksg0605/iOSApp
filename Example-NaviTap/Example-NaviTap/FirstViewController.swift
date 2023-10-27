//
//  SecondViewController.swift
//  Example-NaviTap
//
//  Created by 김선규 on 10/27/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        setupUI()
    }
    
    // MARK: - Configure UI
    private func setupUI() {
        let navi = UINavigationBarAppearance()
        navi.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = navi
        navigationController?.navigationBar.compactAppearance = navi
        navigationController?.navigationBar.scrollEdgeAppearance = navi
        
        title = "Main"
    }
    
}
