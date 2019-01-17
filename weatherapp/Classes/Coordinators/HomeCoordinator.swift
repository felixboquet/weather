//
//  HomeCoordinator.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift

class HomeCoordinator: BaseCoordinator<Void> {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewModel.goHistory.asSignal().emit(onNext: { [weak self] () in
            guard let me = self else {
                return
            }
            me.displayHistory(on: viewController).subscribe().disposed(by: me.disposeBag)
        }).disposed(by: disposeBag)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    public func displayHistory(on rootViewController: UIViewController) -> Observable<Void> {

        let coordinator = HistoryCoordinator(rootViewController: rootViewController)
        return coordinate(to: coordinator)
        
    }
    
}
