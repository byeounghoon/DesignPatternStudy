//
//  ViewModel.swift
//  MVVM
//
//  Created by ByoungHoon Yun on 16/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import GitHubAPI

protocol ViewModelInput {
    func fetchRepositories()
}

protocol ViewModelOutput {
    func refreshList(refreshList:[Repository])
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput? { get set }
}


class ViewModel: NSObject, ViewModelType, ViewModelInput {
    
    let model = Model()
    
    let vc : ViewController
    
    init(_ viewController: ViewController) {
        self.vc = viewController
        super.init()
//        self.vc.tableView.delegate = self
        self.vc.tableView.dataSource = self
    }

    var inputs: ViewModelInput { return self }
    var outputs: ViewModelOutput?
    
    // MARK: input protocol
    func fetchRepositories() {
        model.fetchRepositories {
            self.vc.tableView.reloadData()
        }
    }
    
}

// TableView Datasource & Delegate
extension ViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.repositories.count // list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.reusedCellID)
        
        if cell == nil {
            
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: ViewController.reusedCellID)
            cell?.detailTextLabel?.numberOfLines = 0
        }
        
        let repository = model.repositories[indexPath.row]
        cell?.textLabel?.text = repository.name
        cell?.detailTextLabel?.text = repository.description
        
        return cell!
    }

}


