//
//  SecondViewController.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 10/30/23.
//

import UIKit

class DetailVIewController: UIViewController {

    private let detailView = DetailView()
    var movieData: Movie?
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    private func setupUI() {
        detailView.movieImageView.image = movieData?.movieImage
        detailView.movieTitleLabel.text = movieData?.movieName
        detailView.movieDescriptionLabel.text = movieData?.movieDescription
    }

}
