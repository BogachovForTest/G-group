//
//  EventListSingletonUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class EventListSingletonUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        EventListSingleton.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldSingletonSet() {
        let eventList = EventList(list: [Event(eventTitle: "clearTitle")])
        EventListSingleton.shared.setEventList(newEventList: eventList)
        assert(EventListSingleton.shared.getEventList().getEventList()[0].getEventTitle() == "clearTitle")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
