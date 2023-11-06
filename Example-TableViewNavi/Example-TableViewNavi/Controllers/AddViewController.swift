//
//  AddViewController.swift
//  Example-TableViewNavi
//
//  Created by 김선규 on 11/5/23.
//

import UIKit

class AddViewController: UIViewController {
    
    private let detailView = DetailView()
    var movieData: Movie?
    
    override func loadView() {
        self.view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
