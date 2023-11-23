//
//  ViewController.swift
//  Example-ToDo
//
//  Created by 김선규 on 11/22/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Components
    private let tableView = UITableView()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        
        setupNavigationBar()
        setupTableView()
        setupTableViewConstraints()
    }

    // MARK: - Configure UI
    private func setupNavigationBar() {
        self.title = "메모"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItem = plusButton
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.separatorColor = .none
        
        self.tableView.register(ToDoCell.self, forCellReuseIdentifier: "ToDoCell")
    }
    
    private func setupTableViewConstraints() {
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
    
    @objc private func didTapPlusButton() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

// MARK: - Extension: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

