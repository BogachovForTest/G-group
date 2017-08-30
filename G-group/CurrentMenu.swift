//
//  CurrentMenu.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class CurrentMenu {
    var storeTitle: String!
    var categoryList: [MenuCategory]!
    var gorillaId: Int
    var defultImage: UIImage
    
    init(storeTitle: String = "nope",
         categoryList: [MenuCategory] = [],
         gorillaId: Int = 0,
         defultImage: UIImage = #imageLiteral(resourceName: "photo-icon")
        ) {
        self.storeTitle = storeTitle
        self.categoryList = categoryList
        self.gorillaId = gorillaId
        self.defultImage = defultImage
    }
    
   
    func setTitle(newTitle: String) {
        self.storeTitle = newTitle
    }
    
    func getTitle() -> String {
        return self.storeTitle
    }
    
    func setCategoryList(newCategoryList: [MenuCategory]) {
        self.categoryList = newCategoryList
    }
    
    func getCategoryList() -> [MenuCategory] {
        return self.categoryList
    }
    
    func setGorillaId(newId: Int) {
        self.gorillaId = newId
    }
    
    func getGorillaId() -> Int {
        return self.gorillaId
    }

    func setDefultImage(newImage: UIImage) {
        self.defultImage = newImage
    }
    
    func getDefultImage() -> UIImage {
        return self.defultImage
    }
    
    
    
    
}
