//
//  ViewController.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 10/30/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    
    private lazy var tableView = UITableView()
    let movieDataManager = MovieDataManager()
    var moviesArray: [Movie] = []
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        setupNavigationBar()
        setupTableView()
        setupDatas()
        setupUI()
        
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        self.navigationItem.title = "영화목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        appearance.configureWithOpaqueBackground()
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 120
        self.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        
    }
    
    private func setupDatas() {
        self.movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
    }
    
    @objc private func didTapButton() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        cell.movieImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieTitleLabel.text = moviesArray[indexPath.row].movieName
        cell.movieDescriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
}
