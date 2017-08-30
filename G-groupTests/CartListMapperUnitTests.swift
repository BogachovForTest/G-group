//
//  CartListMapperUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 05.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup


class CartListMapperUnitTests: XCTestCase {
    var cartList: [Cart]!
    var serviceList: [String]!
    
    override func setUp() {
        super.setUp()
        cartList = [Cart(id: 1, store: "Eleven Dogs", title: "aItem"), Cart(id: 2, store: "AL MEZZE", title: "bItem"), Cart(id: 3, store: "AL MEZZE", title: "cItem"), Cart(id: 1, store: "Eleven Dogs", title: "dItem"), Cart(id: 1, store: "Eleven Dogs", title: "eItem")]
        
        serviceList = ["Eleven Dogs","AL MEZZE"]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldMapped() {
        let carectArray = CartListMapper.map(cartList: cartList, services: serviceList)
        assert(carectArray[0] as? UIImage == #imageLiteral(resourceName: "eleven_defult"))
        assert((carectArray[1] as? Cart)?.getTitle() == "aItem")
        assert((carectArray[2] as? Cart)?.getTitle() == "dItem")
        assert((carectArray[3] as? Cart)?.getTitle() == "eItem")
        assert(carectArray[4] as? UIImage == #imageLiteral(resourceName: "almezze_defult"))
        assert((carectArray[5] as? Cart)?.getTitle() == "bItem")
        assert((carectArray[6] as? Cart)?.getTitle() == "cItem")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
