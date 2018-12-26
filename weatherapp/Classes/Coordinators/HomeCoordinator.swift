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
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let viewController = HomeViewController.initFromStoryboard(name: "Main")
        let navigationController = UINavigationController(rootViewController: viewController)
        
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
    
}
