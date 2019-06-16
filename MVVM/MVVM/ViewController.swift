//
//  ViewController.swift
//  MVVM
//
//  Created by ByoungHoon Yun on 15/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import UIKit
import GitHubAPI

class ViewController: UIViewController {

    static let reusedCellID = "ReusedCellID"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.tableFooterView = UIView()
        }
    }
    
    var viewModel : ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyword = "SwiftUI"
        
        self.title = keyword
        self.viewModel = ViewModel(self)
        self.viewModel.fetchRepositories(keyword: keyword)
    }

}

