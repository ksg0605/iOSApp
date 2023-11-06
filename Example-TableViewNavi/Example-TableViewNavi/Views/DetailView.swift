//
//  DetailView.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 11/5/23.
//

import UIKit

class DetailView: UIView {

    // MARK: - UI Components
    let movieImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return UILabel()
    }()
    
    let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return UILabel()
    }()
    
    private lazy var detailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        [movieImageView, movieTitleLabel, movieDescriptionLabel].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(detailStackView)
        
        self.movieImageView.translatesAutoresizingMaskIntoConstraints = false
        self.movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.detailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.detailStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.detailStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.detailStackView.widthAnchor.constraint(equalToConstant: 240),
            
            self.movieImageView.heightAnchor.constraint(equalToConstant: 240),
            
            self.movieTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.movieDescriptionLabel.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
}
