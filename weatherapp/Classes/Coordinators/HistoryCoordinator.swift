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
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        
        let viewModel = HistoryViewModel()
        let viewController = HistoryViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        rootViewController.present(navigationController, animated: true)
        
        return Observable.never()
    }
}
