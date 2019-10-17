//
//  History.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import RealmSwift
import ObjectMapper
import Realm
import SwiftUI
import CoreLocation

class History: Object, Decodable {
    
    @objc dynamic var address: String = ""
    @objc dynamic var date: String?
    @objc dynamic var imageName: String = ""
    @objc dynamic var temperature: Float = 0.0
    
    required convenience public init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    init(address: String, date: String?, imageName: String, temperature: Float) {
        super.init()
        self.address = address
        self.date = date
        self.imageName = imageName
        self.temperature = temperature
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
}

extension History {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

extension History: Mappable {
    
    public func mapping(map: Map) {
        address <- map["timezone"]
        imageName <- map["currently.icon"]
        temperature <- map["currently.temperature"]
    }
    
}
