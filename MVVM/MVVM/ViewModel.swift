//
//  ViewModel.swift
//  MVVM
//
//  Created by ByoungHoon Yun on 16/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import Foundation
import GitHubAPI

protocol ViewModelInput {
    func fetchRepositories()
}

protocol ViewModelOutput {
    func refreshList()
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput? { get set }
}

class ViewModel: ViewModelType, ViewModelInput {
    
    var repositories: [Repository] = []
    
    init() {

    }

    var inputs: ViewModelInput { return self }
    var outputs: ViewModelOutput?
    
    
    // MARK: input protocol
    func fetchRepositories() {
        GitHubAPI.requestRepositories("SwiftUI") { (repositories) in
            self.repositories = repositories
            self.outputs?.refreshList()
        }
    }
    
    
}

