//
//  HistoryCoordinator.swift
//  weatherapp
//
//  Created by Felix Boquet on 17/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift

class HistoryCoordinator: BaseCoordinator<Void> {
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    override func start() -> Observable<Void> {
        
        let viewModel = HistoryViewModel()
        let viewController = HistoryViewController(viewModel: viewModel)
        
        presenter.pushViewController(viewController, animated: true)
        
        return Observable.never()
    }
}
