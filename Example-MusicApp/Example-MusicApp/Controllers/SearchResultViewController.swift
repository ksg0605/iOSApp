//
//  SearchResultViewController.swift
//  Example-MusicApp
//
//  Created by 김선규 on 11/20/23.
//

import UIKit

class SearchResultViewController: UIViewController {

    // MARK: - Variables
    private let networkManager = NetworkManager.shared
    private var musicArrays: [Music] = []
    var searchTerm: String? {
        didSet {
            setupDatas()
        }
    }
    // MARK: - UI Components
    private let collectionView: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        return flow
    }()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Setup Datas
    private func setupDatas() {
        guard let term = searchTerm else { return }
        
        self.musicArrays = []
        
        networkManager.fetchMusic(searchTerm: term) { result in
            switch result {
                case .success(let musicDatas):
                    self.musicArrays = musicDatas
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
