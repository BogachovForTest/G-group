//
//  CategoryRes.swift
//  G-group
//
//  Created by Евгений Богачев on 29.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import AlamofireObjectMapper

class CategoryRes {
    static func getCategoryList(storeId: Int) -> Promise<[MenuCategory]> {
        return Promise{fulfill, reject in
            let URL = "https://gorilla.com.ua/api/v1/category"
            Alamofire.request(URL, method: .get, parameters: ["storeId" : storeId]).responseArray{ (response: DataResponse<[MenuCategory]>) in
                let result = response.value
                fulfill(result!)
            }
        }
    }
    
    static func getItemList(storeId: Int) -> Promise<[MenuItem]>{
        return Promise{fulfill, reject in
            let URL = "https://gorilla.com.ua/api/v1/item"
            Alamofire.request(URL, method: .get, parameters: ["storeId" : storeId, "perPage" : 1000]).responseArray(keyPath: "items") { (response: DataResponse<[MenuItem]>) in
                let result = response.value
                fulfill(result!)
            }
        }
    }
    
}
