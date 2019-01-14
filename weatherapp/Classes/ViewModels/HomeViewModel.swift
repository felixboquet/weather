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
    
//    init() {
//
//    }
    
    public func getLocalWeather() -> String {
        
        let lat = "43.600000"
        let long = "1.433333"
        
        var temp = ""
        
        WeatherApplicationLogic().getWeather(lat: lat, long: long).subscribe { event in
            switch event {
                case .success(let t):
                    print("TEMPERATURE : " + t)
                    temp = t
                case .error(let error):
                    print(error)
            }
        }.disposed(by: disposeBag)
        
//        NetworkManager().getWeather(lat: "43.600000", long: "1.433333") { ([History]) in
//            temp = 
//        }
        
        return temp
    }
    
}
