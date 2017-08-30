//
//  MenuRepoUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 31.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class MenuRepoUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSouldDownloadMenu() {
        MenuRepo.shared.donwnloadMenu()
        .then{ menu -> Void in
            assert(menu.count != 0)
        }
    }
    
    func testShouldSetMenu() {
        let menu: [CurrentMenu] = [CurrentMenu(storeTitle: "clearMenu", gorillaId: 1)]
        MenuRepo.shared.setMenu(newMenu: menu)
        MenuRepo.shared.getMenu()
        assert(MenuRepo.shared.getMenu()[0].getTitle() == "clearMenu")
        assert(MenuRepo.shared.getMenu()[0].getGorillaId() == 1)
    }
}
