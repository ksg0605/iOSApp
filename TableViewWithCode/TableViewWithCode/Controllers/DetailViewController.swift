//
//  DetailViewController.swift
//  TableViewWithCode
//
//  Created by 김선규 on 2023/09/12.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var movieData: Movie?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        detailView.mainImageView.image = movieData?.movieImage
        detailView.movieNameLabel.text = movieData?.movieName
        detailView.descriptionLabel.text = movieData?.movieDescription
    }

}
