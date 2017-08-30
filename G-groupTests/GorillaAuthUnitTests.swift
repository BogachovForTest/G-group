//
//  GorillaAuthUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup


class GorillaAuthUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldSignIn() {
        GorillaAuthRepo.shared.signIn().then{ fulfil -> Void in
            assert(GorillaAuthRepo.shared.getToken() != "nope")
            assert(GorillaAuthRepo.shared.isAuth() == true)
        }
    }
    
    func testShouldSignOut(){
        GorillaAuthRepo.shared.signIn().then{ fulfil -> Void in
            GorillaAuthRepo.shared.signOut()
             assert(GorillaAuthRepo.shared.isAuth() == false)
        }
    }
    func testShouldSetTiken(){
        GorillaAuthRepo.shared.setToken(newToken:"clear")
        assert(GorillaAuthRepo.shared.getToken() == "clear")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
