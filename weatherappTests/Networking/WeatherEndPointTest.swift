//
//  WeatherEndPointTest.swift
//  weatherappTests
//
//  Created by Felix Boquet on 19/03/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import XCTest
import Moya
@testable import weatherapp

class WeatherEndPointTest: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testMoyaRequest() {
        
        let customEndpointClosure = { (target: WeatherEndPoint) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200, target.testSampleData) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        
        let provider = MoyaProvider<WeatherEndPoint>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        
        let expectation = self.expectation(description: "request")
        _ = provider.request(.weather(lat: "43.600000", long: "1.433333")) { res in
            // pass or fail depending on your test needs
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
