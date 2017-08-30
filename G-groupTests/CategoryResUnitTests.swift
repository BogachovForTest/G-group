//
//  CategoryResUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 07.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class CategoryResUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldGetCategory() {
        CategoryRes.getCategoryList(storeId: 121).then{ categoryList -> Void in
            assert(categoryList != nil)
            assert(categoryList[0].getTitle() != nil)
        }
    }
    
    func testShouldGetItemList() {
        CategoryRes.getItemList(storeId: 121).then{ itemList -> Void in
            assert(itemList != nil)
            assert(itemList[0].getId() != nil)
        }
    }

    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
