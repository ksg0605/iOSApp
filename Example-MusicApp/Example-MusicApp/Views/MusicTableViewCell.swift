//
//  MusicTableViewCell.swift
//  Example-MusicApp
//
//  Created by 김선규 on 11/13/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    // MARK: - UI Components
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
