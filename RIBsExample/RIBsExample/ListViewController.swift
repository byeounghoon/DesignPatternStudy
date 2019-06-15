//
//  ListViewController.swift
//  RIBsExample
//
//  Created by ByoungHoon Yun on 16/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol ListPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ListViewController: UIViewController, ListPresentable, ListViewControllable {

    weak var listener: ListPresentableListener?
}
