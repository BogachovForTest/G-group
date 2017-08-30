//
//  WebSiteRepoUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup


class WebSiteRepoUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
                super.tearDown()
    }
    
    func testExample() {
        WebSiteRepository.getEventList().then{ eventList -> Void in
            let eventList = eventList 
            assert(type(of: eventList.getEventList()[0]) == type(of: Event()))
        }
        
        WebSiteRepository.getEventInfoList().then{ eventList ->Void in
            let eventList = eventList 
            assert(type(of: eventList.getEventList()[0]) == type(of: Event()))
            WebSiteRepository.addPhotoUrlToEventList(eventList: eventList)
    }
    
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
