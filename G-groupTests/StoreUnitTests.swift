//
//  StoreUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class StoreUnitTests: XCTestCase {
    var store: Store!
    
    override func setUp() {
        super.setUp()
        store = Store(storePhoto: #imageLiteral(resourceName: "sulguni-cafe"))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldStoreSetExample() {
        store.setStoreUrl(newStoreUrl: "clearURL")
        store.setStoreAdress(newStoreAdress: "clearAdress")
        store.setStoreLikeCount(newStoreLikeCount: 5)
        store.setStoreDescription(newStoreDescription: "clearDescription")
        store.setStorePhoto(newStorePhoto: #imageLiteral(resourceName: "al-mezze"))
        store.setStoreName(newStoreName: "clearName")
        store.setSerchId(newId: 6)
        store.setGorillaId(newId: 4)
        store.setDefultImage(newImage: #imageLiteral(resourceName: "eleven_defult"))
        
        assert(store.getStoreName() == "clearName")
        assert(store.getStoreUrl() == URL(string: "clearURL")!)
        assert(store.getStoreAdress() == "clearAdress")
        assert(store.getStoreLikeCount() == 5)
        assert(store.getStoreDescription() == "clearDescription")
        assert(store.getStorePhoto() == #imageLiteral(resourceName: "al-mezze"))
        assert(store.getSerchId() == 6)
        assert(store.getGorillaId() == 4)
        assert(store.getDefultImage() == #imageLiteral(resourceName: "eleven_defult"))
    }
    
}
