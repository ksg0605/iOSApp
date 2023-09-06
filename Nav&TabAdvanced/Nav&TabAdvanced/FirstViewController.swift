//
//  FirstViewController.swift
//  Nav&TabAdvanced
//
//  Created by 김선규 on 2023/09/06.
//

import UIKit

class FirstViewController: UIViewController {

    var isLoggedIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }
    
    func makeUI() {
        view.backgroundColor = .gray
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
}
