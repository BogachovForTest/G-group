//
//  CartUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 01.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class CartUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCartShouldSet() {
        let cart = Cart()
        cart.setId(newId: 22)
        cart.setCount(newCount: 33)
        cart.setExtraIds(newExtras: [2,3,1])
        cart.setStore(store: "asa")
        cart.setTitle(newTitle: "title")
        cart.setPrice(newPrice: 4)
        assert(cart.getId() == 22)
        assert(cart.getCount() == 33)
        assert(cart.getExtraIds() == [2,3,1])
        assert(cart.getStore() == "asa")
        assert(cart.getTitle() == "title")
        assert(cart.getPrice() == 4)
    }
    
    func testShouldPluseCount() {
        let cart = Cart()
        cart.pluseCount()
        assert(cart.getCount() == 2)
    }
    
    func testShouldMapped() {
        let jsonString = "{\"id\" : \"4\", \"count\" : \"5\", \"extraIds\" : {\"0\" : \"1\", \"1\" : \"3\"}}"
        let cart = Cart(JSONString: jsonString)
        assert(cart?.getId() == 4)
        assert(cart?.getCount() == 5)
        //assert((cart?.getExtraIds())! == [1,3])

    }
    
    
}
