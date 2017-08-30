//
//  MenuMapperUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 31.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class MenuMapperUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldMapped() {
        let categoryList: [MenuCategory] = [MenuCategory(id: 1, title: "firstMenu"), MenuCategory(id: 2, title: "secondMenu")]
        let itemList: [MenuItem] = [MenuItem(title: "ffItem", categoryId: 1), MenuItem(title: "fsItem", categoryId: 1), MenuItem(title: "sfItem", categoryId: 2), MenuItem(title: "ssItem", categoryId: 2)]
        let correctMenu = MenuMapper.mapMenu(categoryList: categoryList, menuList: itemList)
        assert(correctMenu[0].getId() == 1)
        assert(correctMenu[0].getTitle() == "firstMenu")
        assert(correctMenu[0].getItemList()[0].getTitle() == "ffItem")
        assert(correctMenu[0].getItemList()[0].getCategoryId() == 1)
        assert(correctMenu[0].getItemList()[1].getTitle() == "fsItem")
        assert(correctMenu[0].getItemList()[1].getCategoryId() == 1)
        
        assert(correctMenu[1].getId() == 2)
        assert(correctMenu[1].getTitle() == "secondMenu")
        assert(correctMenu[1].getItemList()[0].getTitle() == "sfItem")
        assert(correctMenu[1].getItemList()[0].getCategoryId() == 2)
        assert(correctMenu[1].getItemList()[1].getTitle() == "ssItem")
        assert(correctMenu[1].getItemList()[1].getCategoryId() == 2)
    }
}
