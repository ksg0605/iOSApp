//
//  MusicTableViewCell.swift
//  Example-MusicApp
//
//  Created by 김선규 on 11/20/23.
//

import UIKit

class MusicCell: UITableViewCell {

    // MARK: - Variables
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // MARK: - UI Components
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 6
        [songNameLabel, artistNameLabel, albumNameLabel, releaseDateLabel].forEach {
            sv.addArrangedSubview($0)
        }
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupMainImageView()
        setupLabelStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Configure
    private func setupMainImageView() {
        self.contentView.addSubview(self.mainImageView)
        
        self.mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            self.mainImageView.widthAnchor.constraint(equalToConstant: 100),
            self.mainImageView.heightAnchor.constraint(equalToConstant: 100),
            self.mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
         
    }
    
    private func setupLabelStackView() {
        self.contentView.addSubview(self.labelStackView)
    
        self.labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.labelStackView.leadingAnchor.constraint(equalTo: self.mainImageView.trailingAnchor, constant: 20),
            self.labelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.labelStackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            self.labelStackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor),
        ])
    }
    
    // MARK: - Functions
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }
    }
}
