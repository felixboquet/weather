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
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    override func start() -> Observable<Void> {
        
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        viewController.title = "Home"
        
        viewModel.goHistory.asSignal().emit(onNext: { [weak self] () in
            guard let me = self else {
                return
            }
            me.displayHistory(on: viewController).subscribe().disposed(by: me.disposeBag)
        }).disposed(by: disposeBag)
        
        presenter.pushViewController(viewController, animated: true)
        
        return Observable.never()
    }
    
    public func displayHistory(on rootViewController: UIViewController) -> Observable<Void> {

        let coordinator = HistoryCoordinator(presenter: self.presenter)
        return coordinate(to: coordinator)
        
    }
    
}
