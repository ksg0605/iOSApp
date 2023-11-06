//
//  MemberTableViewCell.swift
//  Example-MemberList
//
//  Created by 김선규 on 11/6/23.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    // MARK: - Variables
    var member: Member? {
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }
    // MARK: - UI Componenets
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        [memberNameLabel, addressLabel].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(labelStackView)
        
        self.mainImageView.translatesAutoresizingMaskIntoConstraints = false
        self.memberNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.mainImageView.heightAnchor.constraint(equalToConstant: 40),
            self.mainImageView.widthAnchor.constraint(equalToConstant: 40),
            self.mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            
            self.memberNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            self.labelStackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            self.labelStackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor),
            self.labelStackView.leadingAnchor.constraint(equalTo: self.mainImageView.trailingAnchor, constant: 20),
            self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
    }
    
}
