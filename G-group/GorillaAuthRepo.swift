//
//  GorillaAuth.swift
//  G-group
//
//  Created by Евгений Богачев on 25.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import PromiseKit

final class GorillaAuthRepo {
    
    private init() {}
    static let shared = GorillaAuthRepo()
    
    var token = "nope"
    var authState = false

    func signIn() -> Promise<String> {
        return Promise { fulfill, reject in
            GorillaAuthRes.signIn().then{token -> Void in
                self.token = token
                self.authState = true
                fulfill(token)
            }
        }
    }
    
    func signOut() {
         GorillaAuthRes.signOut()
         self.authState = false
    }
    
    func isAuth() -> Bool  {
        return self.authState
    }
    
    func getToken() -> String {
        return self.token
    }
    
    func setToken(newToken: String) {
        self.token = newToken
    }
    
}
