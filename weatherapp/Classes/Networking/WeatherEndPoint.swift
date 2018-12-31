//
//  WeatherEndPoint.swift
//  weatherapp
//
//  Created by Felix Boquet on 31/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import Moya

enum WeatherEndPoint {
    
    case weather(lat: String, long: String)
    
}

extension WeatherEndPoint : TargetType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production :
            return ""
        case .qa :
            return ""
        case .staging :
            return "https://api.darksky.net/forecast/" + NetworkManager.APIKey + "/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured")
        }
        
        return url
    }
    
    var path: String {
        return ""
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        var encodable: String!
        
        switch self {
        case .weather(_, _):
            encodable = """
            {
            "response": "Getting the weather..."
            }
            """
        }
        
        guard let data = encodable.data(using: .utf8) else {
            fatalError("Please set a valide exemple")
        }
        
        return data
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
    
}
