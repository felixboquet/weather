//
//  AppCoordinator.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    let rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    override func start() -> Observable<Void> {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        let homeCoordinator = HomeCoordinator(presenter: rootViewController)
        return coordinate(to: homeCoordinator)
    }
}
