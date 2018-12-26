//
//  History.swift
//  weatherapp
//
//  Created by Felix Boquet on 26/12/2018.
//  Copyright © 2018 Felix Boquet. All rights reserved.
//

import RealmSwift

class History: Object {
    
    @objc dynamic var adress: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var temperature: String = ""
    
    func createHistory(adress: String, date: String, image: String, temperature: String) -> History {
        
        let newHistory = History()
        newHistory.adress = adress
        newHistory.date = date
        newHistory.image = image
        newHistory.temperature = temperature
        
        return newHistory
        
    }
    
}
