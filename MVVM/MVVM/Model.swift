//
//  Model.swift
//  MVVM
//
//  Created by ByoungHoon Yun on 16/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import GitHubAPI

//protocol ModelType {
//    func fetchRepositories()
//}

class Model {
    
    var repositories: [Repository] = []
    
    init() {}
    
    func fetchRepositories(complete: @escaping ()->Void) {
        GitHubAPI.requestRepositories("SwiftUI") { (repositories) in
            self.repositories = repositories
            complete()
        }
    }
}

