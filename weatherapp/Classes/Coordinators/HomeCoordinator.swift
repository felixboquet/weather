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
        let navigationController = HomeViewController(viewModel: viewModel)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
}
