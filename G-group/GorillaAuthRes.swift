//
//  GorillaAuthRes.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import PromiseKit

class GorillaAuthRes {
    
    static func signIn() -> Promise<String> {
        return Promise { fulfill, reject in
            var token: String!
            let URL = "https://gorilla.com.ua/api/v1/auth/login"
            Alamofire.request(URL, method: .post, parameters: [
                "login" : "ggroup@integration.com",
                "password" : "ggroup123"
                ]).responseJSON{
                    (response) in
                    let result = response.value as! NSDictionary
                    token = result.value(forKey: "token") as! String
                    fulfill(token)
            }
        }
    }
    
    static func signOut() {
        let URL = "https://gorilla.com.ua/api/v1/auth/logout"
        let header: HTTPHeaders = ["Authorization" : GorillaAuthRepo.shared.getToken()]
        Alamofire.request(URL, method: .post, headers: header ).responseJSON{ (response) in
            
        }
    }
}
