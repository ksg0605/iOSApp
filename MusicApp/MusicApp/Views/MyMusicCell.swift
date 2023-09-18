//
//  MyMusicCell.swift
//  MusicApp
//
//  Created by 김선규 on 2023/09/16.
//

import UIKit

class MyMusicCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
