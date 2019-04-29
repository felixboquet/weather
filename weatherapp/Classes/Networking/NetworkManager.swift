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
    
    // NetworkLoggerPlugin is a pluggin which logs all network activity to the console
    let provider = MoyaProvider<WeatherEndPoint>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let environment: APIEnvironment = .staging
    
    public func getWeather(lat: String, long: String) -> Single<History> {

        return provider.rx.request(.weather(lat: lat, long: long)).mapObject(History.self)
    }
}


