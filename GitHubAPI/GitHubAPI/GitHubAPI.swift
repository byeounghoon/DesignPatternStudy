//
//  GitHubAPI.swift
//  GitHubAPI
//
//  Created by ByoungHoon Yun on 15/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import Foundation

public enum GitHubAPI {
    
    public static func requestRepository(_ keyword: String,
                                         completion: @escaping([Repository]) -> Void) {
        
        let urlString = "https://api.github.com/search/repositories?q=\(keyword)&sort=stars"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared
            .dataTask(with: request, completionHandler: { (data, urlResponse, error) in
                
                guard error == nil else {
                    completion([])
                    return
                }
                
                guard let responseData = data else {
                    completion([])
                    return
                }
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                        completion([])
                        return
                    }
                    
                    guard let items = json["items"] as? Array<[String: Any]> else { return }
                    
                    let repo = items.compactMap({ (item) -> Repository? in
                        guard let name = item["full_name"] as? String,
                        let url = item["url"] as? String,
                        let description = item["description"] as? String,
                            let stargazers_count = item["stargazers_count"] as? Int else { return nil }
                        return Repository(name: name, url: url, description: description, stargazers_count: stargazers_count)
                    })
                    
                    DispatchQueue.main.async {
                        completion(repo)
                    }
                    
                }
                catch {
                    
                }
                
            })
            .resume()
    }
    
}



public struct Repository {
    
    public let name: String
    
    public let url: String
    
    public let description: String
    
    public let stargazers_count : Int
    
}



