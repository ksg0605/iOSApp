//
//  MovieTableViewCell.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 11/2/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - UI Componenets
    let movieImageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        [movieTitleLabel, movieDescriptionLabel].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(movieImageView)
        self.contentView.addSubview(labelStackView)
        
        self.movieImageView.translatesAutoresizingMaskIntoConstraints = false
        self.labelStackView.translatesAutoresizingMaskIntoConstraints = false
        self.movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.movieImageView.heightAnchor.constraint(equalToConstant: 100),
            self.movieImageView.widthAnchor.constraint(equalToConstant: 100),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.movieImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            self.movieTitleLabel.heightAnchor.constraint(equalToConstant: 22),
            
            self.labelStackView.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 15),
            self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.labelStackView.topAnchor.constraint(equalTo: self.movieImageView.topAnchor),
            self.labelStackView.bottomAnchor.constraint(equalTo: self.movieImageView.bottomAnchor),
        ])
    }

}
