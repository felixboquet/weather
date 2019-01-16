//
//  HomeViewModel.swift
//  weatherapp
//
//  Created by Felix Boquet on 02/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    // outputs
    let historyRelay = BehaviorRelay<History?>(value: nil)
    
    let weatherApplicationLogic = WeatherApplicationLogic()
    
    let disposeBag = DisposeBag()
    
    
    public func getLocalWeather() -> Single<String> {
        
        let lat = "43.600000"
        let long = "1.433333"

        return WeatherApplicationLogic().getWeather(lat: lat, long: long).debug()
        
    }
    
}
