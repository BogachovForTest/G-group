//
//  OrderUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 06.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class OrderUnitTests: XCTestCase {
    var order: Order!
    
    override func setUp() {
        super.setUp()
        order = Order()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOrderShouldSet() {
        order.setNoSms(state: 11)
        order.setNoCall(state: 22)
        order.setComment(newComment: "newComment")
        order.setPayType(newPayType: "newPayType")
        order.setPeopleCount(newCount: 33)
        order.setUserName(newUserName: "newName")
        order.setUserPhone(newUserPhone: "+380")
       
        assert(order.getNoSms() == 11)
        assert(order.getNoCall() == 22)
        assert(order.getComment() == "newComment")
        assert(order.getPayType() == "newPayType")
        assert(order.getPeopleCount() == 33)
        assert(order.getUserName() == "newName")
        assert(order.getUserPhone() == "+380")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
