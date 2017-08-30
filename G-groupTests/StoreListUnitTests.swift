//
//  StoreListUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class StoreListUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        StoreList.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldStoreListCorrect() {
        StoreList.shared.createEventList()
        assert(StoreList.shared.getStoreList()[0].getStoreName() == "Suluguni Cafe")
        assert(StoreList.shared.getStoreList()[1].getStorePhoto() == #imageLiteral(resourceName: "al-mezze"))
    }
    
    func testShoudNextAndPreviusCorrect(){
        StoreList.shared.createEventList()
        assert(StoreList.shared.getNextStoreSerch(curent: 18) == 1)
         assert(StoreList.shared.getNextStoreSerch(curent: 7) == 18)
        assert(StoreList.shared.getPreviusStoreSerch(curent: 6) == 9)
        assert(StoreList.shared.getPreviusStoreSerch(curent: 18) == 7)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
