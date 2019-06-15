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
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.rowHeight = UITableView.automaticDimension
            tableView.tableFooterView = UIView()
        }
    }
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputs = self
        viewModel.fetchRepositories()
    }

}

extension ViewController: ViewModelOutput {
    func refreshList() {
        self.tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.reusedCellID)
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: ViewController.reusedCellID)
            cell?.detailTextLabel?.numberOfLines = 0
        }
        
        let repository = viewModel.repositories[indexPath.row]
        cell?.textLabel?.text = repository.name
        cell?.detailTextLabel?.text = repository.description
        
        return cell!
    }
    
}
