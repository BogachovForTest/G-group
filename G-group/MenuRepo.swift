//
//  MenuRepo.swift
//  G-group
//
//  Created by Евгений Богачев on 26.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import PromiseKit

class MenuRepo {
    
    private init() {
    
    }
    static let shared = MenuRepo()
    
    var menu: [CurrentMenu]!
    
    
    func setMenu(newMenu: [CurrentMenu]) {
        self.menu = newMenu
    }
    
    func getMenu() -> [CurrentMenu] {
        return self.menu
    }
    
    func getCurrentCategoryList(storeId: Int) -> Promise<[MenuCategory]> {
        return Promise<[MenuCategory]>{fulfill, reject in
            var currentCategoryList: [MenuCategory] = []
            CategoryRes.getCategoryList(storeId: storeId)
                .then{ categoryList -> Promise<[MenuItem]> in
                    currentCategoryList = categoryList
                    return CategoryRes.getItemList(storeId: storeId)
                }
                .then{ itemList in
                    fulfill( MenuMapper.mapMenu(categoryList: currentCategoryList, menuList: itemList))
            }
        }
    }
    
    func donwnloadMenu() -> Promise<[CurrentMenu]> {
        return Promise<[CurrentMenu]>{fullfill, reject -> Void in
            let menu = StoreList.shared.getGorillaMenuList()
            loop(menu: menu).then{menu -> Void in
                fullfill(menu)
                }
            }
        }
    
    func loop(menu: [CurrentMenu]) -> Promise<[CurrentMenu]> {
        var promiseList: [Promise<CurrentMenu>] = []
        for i in 0...menu.count - 1 {
            let promise = Promise<CurrentMenu>{ fullfill, reject in
                getCurrentCategoryList(storeId: menu[i].getGorillaId())
                .then{ categoryList -> Void in
                    menu[i].setCategoryList(newCategoryList: categoryList)
                    fullfill(menu[i])
                }
            }
            promiseList.append(promise)
        }
        let promise = Promise<[CurrentMenu]>{fullfill, reject in
            when(resolved: promiseList)
                .then{ results -> Void in
                    var menuList: [CurrentMenu] = []
                    for result in results {
                        switch result {
                        case .fulfilled(let value): menuList.append(value)
                        default: break
                        }
                    }
                    fullfill(menuList)
            }
        }
        return promise
    }
    
}




