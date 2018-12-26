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
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let homeCoordinator = HomeCoordinator(window: window)
        return coordinate(to: homeCoordinator)
    }
}
