//
//  MenuItem.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class MenuItem: Mappable {
    var id: Int!
    var price: Int!
    var title: String!
    var categoryId: Int!
    var imageUrl: String!
    var weight: Int!
    var description: String!
    
    
    init(
        id : Int = 0,
        price : Int = 0,
        title : String = "nope",
        categoryId : Int = 0,
        imageUrl : String = "nope",
        weight : Int = 0,
        description : String = "nope"
         ) {
        self.id = id
        self.price = price
        self.title = title
        self.categoryId = categoryId
        self.imageUrl = imageUrl
        self.weight = weight
        self.description = description
    }
    required init?(map: Map) {
    }
    
    //Fix
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        price <- (map["price"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        title <- map["title"]
        categoryId <- (map["categoryId"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        imageUrl <- (map["images.mobileList"])
        weight <- (map["weight"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        description <- map["description"]
    }
    
    func setPrice(newPrice: Int) {
        self.price = newPrice
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    func setTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setCategoryId(newCategoryId: Int) {
        self.categoryId = newCategoryId
    }
    
    func getCategoryId() -> Int {
        return self.categoryId
    }
    
    func setImageUrl(newImageUrl: String) {
        self.imageUrl = newImageUrl
    }
    
    func getImageUrl() -> URL {
        let encoded = self.imageUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let url = URL(string: encoded!)
        return url!
    }
    
    func setWeight(newWeight: Int) {
        self.weight = newWeight
    }
    
    func getWeight() -> Int {
        if (self.weight == nil){
            return 0
        } else {
        return self.weight
        }
    }
    
    func setDescription(newDescription: String) {
        self.description = newDescription    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setId(newId: Int) {
        self.id = newId
    }
    
    func getId() -> Int {
        return self.id
    }

    
}

