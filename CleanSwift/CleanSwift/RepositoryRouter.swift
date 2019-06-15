//
//  RepositoryRouter.swift
//  CleanSwift
//
//  Created by ByoungHoon Yun on 15/06/2019.
//  Copyright (c) 2019 ByoungHoon. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol RepositoryRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol RepositoryDataPassing
{
    var dataStore: RepositoryDataStore? { get }
}

class RepositoryRouter: NSObject, RepositoryRoutingLogic, RepositoryDataPassing
{
    weak var viewController: RepositoryViewController?
    var dataStore: RepositoryDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: RepositoryViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: RepositoryDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}

