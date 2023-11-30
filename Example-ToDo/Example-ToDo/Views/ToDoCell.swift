//
//  ToDoCell.swift
//  Example-ToDo
//
//  Created by 김선규 on 11/22/23.
//

import UIKit

class ToDoCell: UITableViewCell {

    // MARK: - Variables
    var toDoData: ToDoData? {
        didSet {
            configureUIwithData()
        }
    }
    // MARK: - UI Components
    let backView: UIView = {
        let view = UIView()
        return view
    }()
    
    let memoTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let basicView: UIView = {
        let view = UIView()
        return view
    }()
    
    let dateTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var updateButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = .systemFont(ofSize: 9, weight: .bold)
        btn.setImage(UIImage(systemName: "pencil.tip"), for: .normal)
        btn.setTitle("UPDATE", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapUpdateButton() {
        let nextVC = DetailViewController()
        self.present(nextVC, animated: true)

    }
}
