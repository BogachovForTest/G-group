//
//  Cart.swift
//  G-group
//
//  Created by Евгений Богачев on 31.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class Cart: Mappable {
    var id: Int!
    var title: String!
    var count: Int!
    var extraIds: [Int]!
    var store : String!
    var price : Int!

    init(
        id: Int = 0,
        count: Int = 1,
        extraIds: [Int] = [],
        store: String = "nope",
        title: String = "nope",
        price: Int = 0
        ) {
        self.id = id
        self.count = count
        self.extraIds = extraIds
        self.store = store
        self.title = title
        self.price = price
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        count <- (map["count"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        extraIds <- map["extraIds"]
    }
    
    func setId(newId: Int) {
        self.id = newId
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func setCount(newCount: Int) {
        self.count = newCount
    }
    
    func getCount() -> Int {
        return self.count
    }
    
    func setExtraIds(newExtras: [Int]) {
        self.extraIds = newExtras
    }
    
    func getExtraIds() -> [Int] {
        return extraIds
    }
    
    func getStore() -> String {
        return self.store
    }
    
    func setStore(store: String) {
        self.store = store
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setTitle(newTitle: String) {
        self.title = newTitle
    }
    func pluseCount() {
        self.count = count + 1
    }
    
    func setPrice(newPrice: Int) {
        self.price = newPrice
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    
    
    
    
    
}
