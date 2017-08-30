//
//  StoreFactoryUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//


import XCTest
@testable import ggroup

class StoreFactoryUnitTests: XCTestCase {
    
    func testShouldCreateStores() {
        let storeList = StoreFactory.createList()
        
        assert(storeList[0].getStoreName() == "Suluguni Cafe")
        assert(storeList[1].getStoreName() == "AL MEZZE")
        assert(storeList[2].getStoreName() == "Kinza")
        assert(storeList[3].getStoreName() == "«Горячие Перцы» на Маршала Говорова")
        assert(storeList[4].getStoreName() == "Горячие Перцы | Черноморск")
        assert(storeList[5].getStoreName() == "\"Горячие Перцы\" на Королева")
        assert(storeList[6].getStoreName() == "Eleven Dogs")
        assert(storeList[6].getStorePhoto() == #imageLiteral(resourceName: "Eleven_Dogs"))
    }
}
