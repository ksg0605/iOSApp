//
//  ViewController.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 10/30/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    let appearance = UINavigationBarAppearance()
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "영화목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        self.navigationItem.rightBarButtonItem?.tintColor = .black

        
    }
    
    @objc private func didTapButton() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    
}
