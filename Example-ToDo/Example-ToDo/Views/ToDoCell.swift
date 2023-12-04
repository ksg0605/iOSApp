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
    var didTapUpdateButtonClosure: (ToDoCell) -> Void = { (sender) in }

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
    
    // MARK: - Configure UI
    private func configreUI() {
        self.contentView.addSubview(backView)
        self.contentView.addSubview(stackView)
        
        self.basicView.addSubview(dateTextLabel)
        self.basicView.addSubview(updateButton)
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
            stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10),
            
            memoTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            basicView.heightAnchor.constraint(equalToConstant: 30),
            
            dateTextLabel.leadingAnchor.constraint(equalTo: self.basicView.leadingAnchor, constant: 0),
            dateTextLabel.bottomAnchor.constraint(equalTo: self.basicView.bottomAnchor, constant: 0),
            
            updateButton.widthAnchor.constraint(equalToConstant: 70),
            updateButton.heightAnchor.constraint(equalToConstant: 26),
            updateButton.trailingAnchor.constraint(equalTo: self.basicView.trailingAnchor, constant: 0),
            updateButton.bottomAnchor.constraint(equalTo: self.basicView.bottomAnchor, constant: 0),
        ])
        
        memoTextLabel.setContentCompressionResistancePriority(.init(rawValue: 752), for: .horizontal)
    }
    
    
    func configureUIwithData() {
        memoTextLabel.text = toDoData?.memoText
        dateTextLabel.text = toDoData?.dateString
        guard let colorNum = toDoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        backView.backgroundColor = color.bacgroundColor
    }
    
    @objc private func didTapUpdateButton(_ sender: UIButton) {
        didTapUpdateButtonClosure(self)

    }
}
