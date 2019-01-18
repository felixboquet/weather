//
//  NetworkManager.swift
//  weatherapp
//
//  Created by Felix Boquet on 31/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper

enum APIEnvironment {
    case staging
    case qa
    case production
}

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

typealias JSONDictionary = [String:Any]

struct NetworkManager {
    
    static let APIKey = "f7d5a88bf098e518d6c69bf1e64dc52f"
    
    // NetworkLoggerPlugin is a pluggin which logs all network activity to the console
    let provider = MoyaProvider<WeatherEndPoint>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let environment: APIEnvironment = .staging
    
    public func getWeather(lat: String, long: String) -> Single<String> {

       return provider.rx.request(.weather(lat: lat, long: long)).debug().mapString(atKeyPath: "currently.temperature").catchErrorJustReturn("Error") // Ok it's a demo, just say Error
        
       
    }
}


