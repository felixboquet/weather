//
//  HistoryTests.swift
//  weatherapp
//
//  Created by Felix Boquet on 15/03/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import XCTest
@testable import weatherapp

class HistoryTests: XCTestCase {
    
    func testInitHistory() {
        
        let history = History(address: "19 rue de Bayard, 31000 Toulouse", date: nil, imageName: "soleil", temperature: 10.0)
        
        XCTAssertEqual("19 rue de Bayard, 31000 Toulouse", history.address)
        XCTAssertEqual(nil, history.date)
        XCTAssertEqual("soleil", history.imageName)
        XCTAssertEqual(10.0, history.temperature)
        
    }
    
    func testInitHistoryWithDate() {
        
        let history = History(address: "19 rue de Bayard, 31000 Toulouse", date: "15/03/2019", imageName: "soleil", temperature: 10.0)
        
        XCTAssertEqual("15/03/2019", history.date)
        
    }

}
