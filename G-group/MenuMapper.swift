//
//  MenuMapper.swift
//  G-group
//
//  Created by Евгений Богачев on 29.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation


class MenuMapper {
    static func mapMenu(categoryList: [MenuCategory], menuList: [MenuItem]) -> [MenuCategory]{
        for menuCategory in categoryList {
            for menuItem in menuList {
                if(menuCategory.getId() == menuItem.getCategoryId()) {
                    menuCategory.addItemToList(newItem: menuItem)
                }
            }
        }
        return categoryList
    }
}
