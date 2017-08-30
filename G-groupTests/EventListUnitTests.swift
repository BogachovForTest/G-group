//
//  EventListUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class EventListUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldSetEventList() {
        let eventList = EventList(list: [Event()])
        let newEventList = EventList(list: [Event()])
       newEventList.getEventList()[0].setEventTitle(newEventTitle: "newTitle")
        eventList.setEventList(list: newEventList.getEventList())
        assert(eventList.getEventList()[0].getEventTitle() == "newTitle")
    }
    
    func testShouldAddEvent() {
        let eventList = EventList(list: [Event()])
        let newEvent = Event(eventTitle: "newTitle")
        let newSecondEvent = Event(eventTitle: "newSecondTitle")
        eventList.addEvent(newEvent: newEvent)
        eventList.addEvent(newEvent: newSecondEvent)
        assert(eventList.getEventList()[0].getEventTitle() == "newTitle")
        assert(eventList.getEventList()[1].getEventTitle() == "newSecondTitle")
    }
    
    func testShouldGetEventMediaList() {
        let eventList = EventList(list: [Event(), Event(), Event()])
        eventList.getEventList()[0].setEventPhotoId(newEventPhotoId: 0)
        eventList.getEventList()[1].setEventPhotoId(newEventPhotoId: 1)
        eventList.getEventList()[2].setEventPhotoId(newEventPhotoId: 2)
        let mList = eventList.getEventMediaList()
        assert(mList[0] == 0)
        assert(mList[1] == 1)
        assert(mList[2] == 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
