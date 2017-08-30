 //
//  MenuCategory.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class MenuCategory: Mappable {
    var id: Int!
    var title: String!
    var itemList: [MenuItem]!
    
    init(id: Int = 0,
         title: String = "nope",
         itemList: [MenuItem] = []
        ) {
        self.id = id
        self.title = title
        self.itemList = itemList
    }
    
    required init?(map: Map) {
    }
    
    //Fix
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        title <- map["title"]
    }
    
    func setId(newId: Int) {
        self.id = newId
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func setTitle(newTitle: String) {
        self.title = newTitle
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setItemList(newItemList: [MenuItem]) {
        self.itemList = newItemList
    }
    
    func getItemList() -> [MenuItem] {
        return self.itemList
    }
    
    func addItemToList(newItem: MenuItem) {
        if (itemList == nil){
            setItemList(newItemList: [newItem])
        } else {
        self.itemList.append(newItem)
        }
    }
    
    
    
    
}
