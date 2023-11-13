//
//  ViewController.swift
//  Example-MemberList
//
//  Created by 김선규 on 11/6/23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Variables
    var membersListManager = MemberListManager()
    
    // MARK: - UIComponents
    private let tableView = UITableView()
    
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
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            self.title = "회원 목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            self.navigationController?.navigationBar.compactAppearance = appearance
            
        }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 60
        self.tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }

    private func setupDatas() {
        self.membersListManager.makeMembersListDatas()
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }
    
    @objc private func didTapAddButton() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.membersListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MemberTableViewCell
        cell.member = membersListManager[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - Extension: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        let currentMember = membersListManager.getMembersList()[indexPath.row]
        detailVC.member = currentMember
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Extension: MemberDelegate (Custom)
extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        membersListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, member: Member) {
        membersListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
    
    
}
