//
//  ViewController.swift
//  MVC
//
//  Created by ByoungHoon Yun on 15/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import UIKit
import GitHubAPI

class ViewController: UIViewController {
    
    static let reusedCellID = "ReusedCellID"
    
    var repos = [Repository]()

    @IBOutlet weak var tableView: UITableView! {
        
        didSet {
            
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.rowHeight = UITableView.automaticDimension
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.fetchRepositories()
    }
    
}

extension ViewController {
    
    func fetchRepositories() {
        
        // Business
        GitHubAPI.requestRepositories("swiftUI") { (repositories) in
            
            self.repos = repositories
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.reusedCellID)
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: ViewController.reusedCellID)
            cell?.detailTextLabel?.numberOfLines = 0
        }
        
        let repository = repos[indexPath.row]
        cell?.textLabel?.text = repository.name
        cell?.detailTextLabel?.text = repository.description
        
        return cell!
    }
    
}
