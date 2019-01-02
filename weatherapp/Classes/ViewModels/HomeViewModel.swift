//
//  HomeViewModel.swift
//  weatherapp
//
//  Created by Felix Boquet on 02/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    // Call to update the weather
    let updateWeather: AnyObserver<Void>
    
    init() {
        
        let _updateWeather = PublishSubject<Void>()
        self.updateWeather = _updateWeather.asObserver()
        
    }
    
    public func getLocalWeather() {
        
        print("coucou")
        
    }
    
}
