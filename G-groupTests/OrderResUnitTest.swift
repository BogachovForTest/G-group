//
//  OrderResUnitTest.swift
//  G-group
//
//  Created by Евгений Богачев on 21.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class OrderResUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldOrdered() {
        let order = Order(userName: "Женя", userPhone: "+380635337250", noCall: 1, noSms: 1, peopleCount: 1, comment: "test", payType: "cart", time: "00")
        let cartList = [Cart(id: 3, count: 2), Cart(id: 2, count: 1)]
        let adress = "Пантелеймоновская 76"
        ReadyOrderRepo.shared.setCardList(newCartList: cartList)
        ReadyOrderRepo.shared.setOrder(newOrder: order)
        ReadyOrderRepo.shared.setAdress(newAdress: adress)
        ReadyOrderRepo.shared.mapForRequset()
        ReadyOrderRepo.shared.sendRequest().then { result -> Void in
            print(result)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
