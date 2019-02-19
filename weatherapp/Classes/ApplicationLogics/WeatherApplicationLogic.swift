//
//  WeatherApplicationLogic.swift
//  weatherapp
//
//  Created by Felix Boquet on 02/01/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public struct WeatherApplicationLogic {
    
    private let disposeBag = DisposeBag()
    private let networkManager = NetworkManager()
    
    func getWeather(lat: String, long: String) -> Single<History> {
        print("getting weather...")
        
        return networkManager.getWeather(lat: lat, long: long)
    }
    
}
