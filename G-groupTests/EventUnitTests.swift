//
//  G_groupTests.swift
//  G-groupTests
//
//  Created by Евгений Богачев on 21.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup



class G_groupTests: XCTestCase {
    var event: Event!
    
    override func setUp() {
        super.setUp()
        event = Event(postId: 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldSetAll() {
        event.setEventTitle(newEventTitle: "clearTitle")
        event.setEventURL(newEventURL: "clearURL")
        event.setPostId(newPostId: 32)
        event.setEventPhotoId(newEventPhotoId: 1)
        assert(event.getEventTitle() == "clearTitle")
        assert(event.getEventURL() == URL(string: "clearURL"))
        assert(event.getPostId() == 32)
        assert(event.getEventPhotoId() == 1)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
