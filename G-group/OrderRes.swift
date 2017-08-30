//
//  OrderRes.swift
//  G-group
//
//  Created by Евгений Богачев on 13.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
class OrderRes {
    static func sendOrder(parameters: Parameters) -> Promise<String>{
        return Promise<String>{ fulfill, reject in
            print(parameters)
            let url = "https://gorilla.com.ua/api/v1/order/make"
            var headers = Alamofire.SessionManager.defaultHTTPHeaders
            headers["Authorization"] = "Bearer \(GorillaAuthRepo.shared.getToken())"
            Alamofire.request(url, method: .post, parameters:parameters, headers: headers).responseJSON{
                (response) in

                if let result = response.value as? String {
                    print(result)
                }
                else {
                    let result = response.value as? NSDictionary
                    print(result)
                }
                
                fulfill("dfdf")
            }
        }
    }
}
