//
//  ListInteractor.swift
//  RIBsExample
//
//  Created by ByoungHoon Yun on 16/06/2019.
//  Copyright © 2019 ByoungHoon. All rights reserved.
//

import RIBs
import RxSwift

protocol ListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ListPresentable: Presentable {
    var listener: ListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ListListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ListInteractor: PresentableInteractor<ListPresentable>, ListInteractable, ListPresentableListener {

    weak var router: ListRouting?
    weak var listener: ListListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ListPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
