//
//  UserRepo.swift
//  G-group
//
//  Created by Евгений Богачев on 12.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation

final class UserRepo {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = UserRepo()
    
    // MARK: fix
    
    var user: Int!
    
    func getUser() -> Int {
        return user
    }
    
    func isAuth() -> Bool {
        return false
    }
    
}
