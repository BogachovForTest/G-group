//
//  CartListUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 07.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class CartListUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        CartListRepo.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldSet() {
        CartListRepo.shared.setServices(newServices: ["aService", "bService"])
        CartListRepo.shared.setCartList(newCartList: [Cart(id: 3), Cart(id: 5)])
        
        assert(CartListRepo.shared.getServices()[0] == "aService")
        assert(CartListRepo.shared.getServices()[1] == "bService")
        assert(CartListRepo.shared.getCartList()[0].getId() == 3)
        assert(CartListRepo.shared.getCartList()[1].getId() == 5)
    }
    
    func testShodAddCart() {
        //if cartList == nill
        CartListRepo.shared.addCart(newCart: Cart(id: 7), store: "aStore")
        assert(CartListRepo.shared.getCartList()[0].getId() == 7)
        assert(CartListRepo.shared.getServices()[0] == "aStore")
        
        CartListRepo.shared.addCart(newCart: Cart(id: 7), store: "aStore")
        
        assert(CartListRepo.shared.getCartList()[0].getId() == 7)
        assert(CartListRepo.shared.getServices()[0] == "aStore")
        assert(CartListRepo.shared.getCartList()[0].getCount() == 2)
        
        CartListRepo.shared.addCart(newCart: Cart(id: 8), store: "aStore")
        
        assert(CartListRepo.shared.getCartList()[1].getId() == 8)
        assert(CartListRepo.shared.getServices()[0] == "aStore")
        
        CartListRepo.shared.addCart(newCart: Cart(id: 9), store: "bStore")
        
        assert(CartListRepo.shared.getCartList()[2].getId() == 9)
        assert(CartListRepo.shared.getServices()[1] == "bStore")
    }
    
    func testShouldAddLessCount() {
        CartListRepo.shared.setCartList(newCartList: [])
        CartListRepo.shared.addCart(newCart: Cart(id: 7), store: "aStore")
        CartListRepo.shared.addCount(cartId: 7)
        assert(CartListRepo.shared.getCartList()[0].getCount() == 2)
        CartListRepo.shared.lessCount(cartId: 7)
        assert(CartListRepo.shared.getCartList()[0].getCount() == 1)
        CartListRepo.shared.lessCount(cartId: 7)
        assert(CartListRepo.shared.getCartList().count == 0)
    }
    
    func testShouldMapped() {
        CartListRepo.shared.cartList == nil
        var result = CartListRepo.shared.mapToAdapter()

        CartListRepo.shared.setServices(newServices: ["Eleven Dogs", "AL MEZZE"])
        CartListRepo.shared.setCartList(newCartList: [Cart(id: 3, store: "Eleven Dogs"), Cart(id: 5, store: "AL MEZZE")])
        
        result = CartListRepo.shared.mapToAdapter()
        
        assert(result[0] is UIImage)
        assert(result[1] is Cart)
    }
    
    func testShouldCheckIsSrviceExist() {
        CartListRepo.shared.setCartList(newCartList: [])
        CartListRepo.shared.setServices(newServices: ["Eleven Dogs", "AL MEZZE"])
        CartListRepo.shared.setCartList(newCartList: [Cart(id: 3, store: "Eleven Dogs"), Cart(id: 5, store: "AL MEZZE")])
        assert(CartListRepo.shared.isServiceExist(store: "Eleven Dogs") == true)
        assert(CartListRepo.shared.isServiceStillExist(store: "Eleven Dogs") == true)
        
        CartListRepo.shared.removeCart(index: 0)
        CartListRepo.shared.removeCart(index: 0)
        assert(CartListRepo.shared.isServiceExist(store: "Eleven Dogs") == false)
        assert(CartListRepo.shared.isServiceStillExist(store: "Eleven Dogs") == false)
        
        CartListRepo.shared.services = nil
        assert(CartListRepo.shared.isServiceExist(store: "Eleven Dogs") == false)
    }
    
    func testShouldFindById() {
        CartListRepo.shared.setCartList(newCartList: [])
        CartListRepo.shared.setServices(newServices: ["Eleven Dogs", "AL MEZZE"])
        CartListRepo.shared.setCartList(newCartList: [Cart(id: 3, store: "Eleven Dogs"), Cart(id: 5, store: "AL MEZZE")])
        
        assert(CartListRepo.shared.findCartById(id: 5) == 1)
        assert(CartListRepo.shared.findCartById(id: 99) == 0)
    }
    
    func testShouldFindCardExist() {
        CartListRepo.shared.setCartList(newCartList: [])
        CartListRepo.shared.setServices(newServices: ["Eleven Dogs", "AL MEZZE"])
        CartListRepo.shared.setCartList(newCartList: [Cart(id: 3, store: "Eleven Dogs"), Cart(id: 5, store: "AL MEZZE")])
        
        var test = CartListRepo.shared.isCartExist(newCart: Cart(id: 3, store: "Eleven Dogs"))
        assert(test.0 == true)
        assert(test.1 == 0)
        CartListRepo.shared.setCartList(newCartList: [])
         test = CartListRepo.shared.isCartExist(newCart: Cart(id: 3, store: "Eleven Dogs"))
        assert(test.0 == false)
        assert(test.1 == 00)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
